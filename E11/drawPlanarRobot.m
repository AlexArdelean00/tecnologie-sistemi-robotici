function [] = drawPlanarRobot(links, joints, color)
    % disegna un robot planare note la lunghezza dei link e l'angolo dei 
    % giunti

    x = 0;
    y = 0;
    joint = 0;
    N = size(links, 2);
    for i= 1:N
        hold on
        joint = joint + joints(i);
        deltaX = links(i)*cos(joint);
        deltaY = links(i)*sin(joint);
        plot([x, x+deltaX], [y, y+deltaY], color, 'LineWidth', 2);
        x = x+deltaX;
        y = y+deltaY;
    end

    % disegna end effector
    ang = pi/2-joint; % angolo alterno interno
    dim = 0.2; % dimensione EE
    ee1 = [x-dim*cos(ang), y+dim*sin(ang)];
    ee2 = [x+dim*cos(ang), y-dim*sin(ang)];
    plot([ee1(1), ee2(1)], [ee1(2), ee2(2)], color, 'LineWidth', 2);
    ee11 = [ee1(1)+dim*cos(joint), ee1(2)+dim*sin(joint)];
    ee22 = [ee2(1)+dim*cos(joint), ee2(2)+dim*sin(joint)];
    plot([ee1(1), ee11(1)], [ee1(2), ee11(2)], color, 'LineWidth', 2);
    plot([ee2(1), ee22(1)], [ee2(2), ee22(2)], color, 'LineWidth', 2);
end