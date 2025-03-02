clear
clc
syms l1 l2 l3 q1 q2 q3
DHRRRplanare = [l1, 0, 0, q1;
                l2, 0, 0, q2;
                l3, 0, 0, q3];

syms q1 q2 q3 q4 q5 q6 d2 d6 real
DHstanford = [0, -pi/2, 0, q1;
                0, pi/2, d2, q2;
                0, 0, q3, 0;
                0, -pi/2, 0, q4;
                0, pi/2, 0, q5;
                0, 0, d6, q6];

syms q1 q2 q3 d2 real
DHsferico = [0, -pi/2, 0, q1;
              0, pi/2, d2, q2;
              0, 0, q3, 0];

syms q1 q2 q3 a2 a3 real
DHantro = [0, pi/2, 0, q1;
              a2, 0, 0, q2;
              a3, 0, 0, q3];

syms q4 q5 q6 d6 real
DHpolso = [0, -pi/2, 0, q4;
              0, pi/2, 0, q5;
              0, 0, d6, q6];

J = simplify(jacGeom(DHstanford, [1 1 0 1 1 1]));
J11 = J(1:3, 1:3);
detJ11 = simplify(det(J11))
J22 = J(4:6, 4:6);
detJ22 = simplify(det(J22))

%tList = cinDirDH(DHpolso);
%dim = size(tList);
%for i=1:dim(2)
%    simplify(tList{i});
%end

