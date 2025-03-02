function [] = plot2Dtraj(q_f, rRif, color)
     if ~exist('color','var')
         % third parameter does not exist, so default it to something
          color = 'b';
     end

    % plot delle curve di livello della norma dell'errore cartesiano al quadrato
    [q11, q22] = meshgrid(-pi:.1:pi,-pi:.1:pi);
    f1 = cos(q11)+cos(q11+q22);
    f2 = sin(q11)+sin(q11+q22);
    e1 = rRif(1)-f1;
    e2 = rRif(2)-f2;
    n_e = e1.^2+e2.^2; % norma dell'errore cartesiano al quadrato
    figure(2)
    contour(q11, q22, n_e, 50) % curve di livello
    grid on;
    hold on;
    % plot traiettoria di q
    hold on
    f1 = cos(q_f(1,:))+cos(q_f(1,:)+q_f(2,:));
    f2 = sin(q_f(1,:))+sin(q_f(1,:)+q_f(2,:));
    e1 = rRif(1)-f1;
    e2 = rRif(2)-f2;
    zTra = e1.^2+e2.^2;
    plot(q_f(1,:),q_f(2,:), 'Color', color)
    
    % disegna condizione iniziale
    scatter(q_f(1,1), q_f(2,1), 'filled', 'MarkerFaceColor', 'r');
    text(q_f(1,1), q_f(2,1), zTra(1), 'q_i', 'FontSize', 12, 'FontWeight', 'bold');
    
    % disegna la soluzione finale
    scatter(q_f(1,end), q_f(2,end), 'filled', 'MarkerFaceColor', 'g');
    text(q_f(1,end), q_f(2,end), 'q_f', 'FontSize', 12, 'FontWeight', 'bold');
    hold off
end