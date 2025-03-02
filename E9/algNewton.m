function [q_f, iter, deltaQ, currentError] = algNewton(condIniz, riferimento)
    % iperparametri
    maxIter = 1000; % massimo numero di iterazioni
    minQ = 0.00001; % minima variazione delle variabili di giunto
    minE = 0.00001; % distanza minima dal punto di arrivo
    alpha = 0.1; % passo
    
    % inizializzazione variabili
    q_i = condIniz; % condizioni iniziali
    rRif = riferimento; % riferimento
    iter = 1; % contatore per le iterazioni
    deltaQ = realmax; % variazione delle variabili di giunto in modulo
    currentError = realmax; % errore corrente
    q_f = q_i; % andamento di q, ultimo valore = valore finale, primo valore = cond. iniz.
    
    % passo iterativo
    while(iter < maxIter && deltaQ > minQ && currentError > minE)
        q = q_f(:, end);
        q_1 = q(1);
        q_2 = q(2);
        Jinv = 1/sin(q_2)*[cos(q_1+q_2), sin(q_1+q_2); -cos(q_1)-cos(q_1+q_2), -sin(q_1)-sin(q_1+q_2)];
        fr = [cos(q_1)+cos(q_1+q_2); +sin(q_1)+sin(q_1+q_2)];
        newQ = q + alpha*Jinv*(rRif-fr);
        q_f = [q_f, newQ];
        deltaQ = norm(newQ-q);
        currentError = norm(rRif-fr);
        iter = iter + 1;
    end
    iter
    deltaQ
    currentError
end