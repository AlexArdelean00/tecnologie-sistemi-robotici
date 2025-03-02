function [xdot] = modelloPM(t, x, m, rif, Kd, Kp, Ki, g0, a)
    A = [0, 1;
         0, 0];

    B = [0; 1/m];

    persistent last_e;
    if(isempty(last_e))
        last_e = rif(1)-x(1);
    end

    e = rif(1)-x(1);

    P = Kp*e;
    D = Kd*(e-last_e);
    I = Ki*e;
    compG = m*g0;

    u = P + D + I + a*compG;

    xdot = A*x + B*u - [0; 1/g0];

    last_e = e;
end