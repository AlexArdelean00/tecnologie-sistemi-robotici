function [] = drawAngle(vec1, vec2)
    % Disegna l'angolo tra due vettori

    raggio = 0.2;
    P1 = vec1/norm(vec1)*raggio;
    P2 = vec2/norm(vec2)*raggio;
    nrPunti = 100;
    angle = acos(dot(P1,P2) / (norm(P1) * norm(P2)));
    cross_product = cross(P1, P2);
    segno = 1;
    if cross_product(3) < 0
        angle = 2*pi - angle;
        segno = -1;
    end
    theta = linspace(0, angle, nrPunti);
    asse = cross(P1, P2);
    x = [];
    y = [];
    z = [];
    for i = 1:length(theta)
        R = matRot(asse, segno*theta(i));
        p = R*P1;
        x = [x p(1)];
        y = [y p(2)];
        z = [z p(3)];
    end
    c = segno*(P1+P2)/1.5;
    plot3(x, y, z, 'LineWidth', 2);
    text(c(1), c(2), c(3), string(angle), 'FontSize', 7);
end