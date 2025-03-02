function [q] = cinInvAnaliticaRRPpolare(P, d1)
    Px = P(1);
    Py = P(2);
    Pz = P(3);

    q3 = sqrt(Px^2 + Py^2 + (Pz-d1)^2);
    if(q3 == 0)
        q1 = NaN;
        q2 = NaN;
    else
        s2 = (Pz-d1)/q3;
        c2 = 1/q3*sqrt(Px^2+Py^2);
        q2 = atan2(s2, c2);

        if(c2 == 0)
            q1 = NaN;
        else
            c1 = Px/(q3*c2);
            s1 = Py/(q3*c2);
            q1 = atan2(s1, c1);
        end 
    end
    q = [q1; q2; q3];
end