function [jacGeom] = jacGeom(parDH, types)
    % ordine parametri: a alpha d theta type
    % type => 0 prismatico, 1 rotoidale
    N = size(parDH,1); % numero di giunti
    tList = cinDirDH(parDH); % lista di trasformazioni i-(i-1) e 0-N
    
    % calcolo la lista di trasformazioni 0-i
    tList0i{1} = eye(4); % trasformazione 0-0
    for i=1:N
        tList0i{i+1} = simplify(tList0i{i}*tList{i}); % trasformazione 0-(i+1)
    end

    TN = simplify(tList0i{N+1}); % cinematica diretta 0-N
    P0E = TN(1:3, 4); % posa end effector
    for i=1:N
        T = tList0i{i};
        z = T(1:3,1:3)*[0; 0; 1]; % z_{i-1}
        % prismatico
        if(types(i) == 0)
            JL = z;
            JA = [0; 0; 0];
        % rotoidale
        else
            P0i = T(1:3, 4);
            P1E = simplify(P0E-P0i); % P_{i-1,E}
            JL = simplify(cross(z, P1E));
            JA = z;
        end
        jacGeom(1:3, i) = JL;
        jacGeom(4:6, i) = JA;
    end
end