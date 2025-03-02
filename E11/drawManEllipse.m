function [] = drawManEllipse(J, center, color)
    [V, D] = eig(J*J.'); % autovettori (colonnne di V) e autovalori (diagonale di D)
    lambda = diag(D); % autovalori
    sigma = sqrt(lambda); % valori singolari
    %w = sqrt(det(J*J.'))

    u1 = double(V(1:end, 1)); % semiasse 1
    u2 = double(V(1:end, 2)); % semiasse 2

    u1 = u1/norm(u1);
    u2 = u2/norm(u2);

    u1length = double(sigma(1)); % lunghezza semiasse 1
    u2length = double(sigma(2)); % lunghezza semiasse 2

    % punti dell'ellisse
    theta = linspace(0, 2*pi, 100);
    x = u1length * cos(theta) * u1(1) + u2length * sin(theta) * u2(1) + center(1);
    y = u1length * cos(theta) * u1(2) + u2length * sin(theta) * u2(2) + center(2);

    % diesgna ellisse
    hold on
    f = fill(x, y, color);
    set(f,'edgecolor', color, 'LineStyle','--');
    alpha(f,.2)
    %plot(x, y, '--r', 'LineWidth', 2, 'Color', color);

    % disegna assi
    quiver(center(1), center(2), u1(1)*u1length, u1(2)*u1length, 0, 'b', ...
        'LineWidth', 1, 'Color', color, 'MarkerSize', 1);
    quiver(center(1), center(2), u2(1)*u2length, u2(2)*u2length, 0, 'b', ...
        'LineWidth', 1, 'Color', color, 'MarkerSize', 1);
    
    axis equal;
end