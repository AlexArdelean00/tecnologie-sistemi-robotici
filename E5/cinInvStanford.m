function [q] = cinInvStanford(T06, d2, d6)
    d1 =  [0; 0; d6];
    d06 = T06(1:3, 4);
    R = T06(1:3, 1:3);
    dhat = d06 - R*d1;

    % manipolatore sferico RRP
    q3 = sqrt(dhat.'*dhat-d2^2);

    if(q3 == 0)
        c1 = -dhat(1)/d2;
        s1 = dhat(2)/d2;
        q1 = atan2(s1, c1);
        
        q2 = "arbitrario";

        q4 = "non definito";
        q5 = "non definito";
        q6 = "non definito";
    else
        c2 = dhat(3)/q3;
        s2 = sqrt(1-c2^2);
        q2 = atan2(s2, c2);

        c1 = (dhat(1)*q3*s2+d2*dhat(2))/(q3^2*s2^2+d2^2);
        s1 = sqrt(1-c1^2);
        q1 = atan(s1, c1);

        % polso sferico RRR
        R03 = [cos(q1)*cos(q2), -sin(q1), cos(q1)*sin(q2);
              cos(q2)*sin(q1), cos(q1), sin(q1)*sin(q2);
              -sin(q2), 0, cos(q2)];

        R = T06(1:3, 1:3);
        R36 = R03.'*R;
    
        c5 = R36(3, 3);
        s5 = sqrt(1-c5^2);
        q5 = atan2(s5, c5);
    
        if(c5 == 1 || c5 == -1)
            theta = atan2(R36(2,1), R36(1,1));
            q4 = "theta = q4 + q5 = " + theta;
            q5 = "theta = q4 + q5 = " + theta;
        else
            s6 = R36(3,2)/sqrt(1-R36(3,3)^2);
            c6 = sqrt(1-R36(3,2)^2/(1-R36(3,3)^2));
            q6 = atan2(s6, c6);
    
            c4 = R36(1,3)/sqrt(1-R36(3,3)^2);
            s4 = R36(2,3)/sqrt(1-R36(3,3)^2);
            q4 = atan2(s4, c4);
        end
    end

    q = round([q1, q2, q3, q4, q5, q6],2);
end