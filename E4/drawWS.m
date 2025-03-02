function [] = drawWS(center, radius, color)
    centerX = center(1);
    centerY = center(2);
    dotSize = 2; 

    % punti quadrato
    x = linspace(centerX - radius, centerX + radius, 100);
    y = linspace(centerY - radius, centerY + radius, 100);
    [X, Y] = meshgrid(x, y);
    
    % distanza punti quadrato dal centro
    dist = sqrt((X - centerX).^2 + (Y - centerY).^2);
    
    % seleziona punti interni alla circonferenza
    pointsInsideCircle = dist <= radius;
    
    % Flatten the selected points into column vectors
    X_WS = X(pointsInsideCircle);
    Y_WS = Y(pointsInsideCircle);
    
    % Create the scatter plot with dotted pattern
    c = scatter(X_WS(:), Y_WS(:), dotSize, 'filled', 'MarkerFaceColor', color, 'MarkerEdgeColor', 'none');
    alpha(c, 0.5);
    axis equal;
end