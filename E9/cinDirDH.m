function [mList] = cinDirDH(par)
    % a alpha d theta
    % cinDirDH - Calcola le matrici di trasformazione (i-1)-(i) e (0)-(n) 
    %               data la matrice dei parametri DH.
    %
    % Syntax:
    % mList = cinDirDH(par)
    %
    % Description:
    % La funzione matRot un solo argomento par che rappresenta la matrice 
    % dei parametri DH nx4. Restituisce una lista di matrici che 
    % rappresentano le matrici di trasformazione omogenea (i-1)-(i) e 
    % (0)-(n). 
    %
    % Inputs:
    % - par: Una matrice nx4 rappresentante una matrice di parametri DH. I
    %           parametri DH sono nell'ordine a alpha d theta.
    %
    % Output:
    % - mList: Lista di lunghezza n+1 di matrici di trasmormazione omogenea
    %           (i-1)-(i) con i = 1,...,n e (0)-(n).         
    
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