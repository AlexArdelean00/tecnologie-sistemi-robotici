function [R] = matRot(r,theta)
    % Calcola la matrice di rotazione dato l'asse e l'angolo.

    % Controlla che il vettore r abbia 3 componenti
    assert(numel(r) == 3, 'Il vettore r deve avere 3 componenti');

    % Controlla che theta sia uno scalare
    assert(isscalar(theta), 'L''angolo theta deve essere uno scalare');

    % Converte il vettore r in un vettore colonna a 3 componenti
    r = reshape(r, [3,1]);

    % Normalizza il vettore r
    % Se r è nullo si pone theta=0 in modo da avere R=I
    rNorm = norm(r);
    if(rNorm > 0)
        r = r/rNorm;
    else
        theta = 0;
    end

    rx = r(1);
    ry = r(2);
    rz = r(3);
    S = [0, -rz, ry; rz, 0, -rx; -ry, rx, 0];
    
    R = r*(r.') + (eye(3)-r*(r.'))*cos(theta) + S*sin(theta);
end