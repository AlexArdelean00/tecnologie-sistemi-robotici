function [mList] = cinDirDH(par)  
    % cinDirDH - Calcola le matrici di trasformazione (i-1)-(i) e (0)-(n) 
    %               data la matrice dei parametri DH.     
    % L'ordine dei parametri è: a alpha d theta
    
    matDH = eye(4);
    N = size(par,1);
    for k = 1:N
        a = par(k, 1);
        alpha = par(k, 2);
        d = par(k, 3);
        theta = par(k, 4);
        
        cth = cos(theta);
        sth = sin(theta);
        cal = cos(alpha);
        sal = sin(alpha);
        
        A = [cth, -sth*cal, sth*sal, a*cth;
             sth, cth*cal, -cth*sal, a*sth;
             0, sal, cal, d;
             0, 0, 0, 1];
        
        matDH = matDH*A;
        mList{k} = simplify(A);
    end
    mList{k+1} = simplify(matDH);
end