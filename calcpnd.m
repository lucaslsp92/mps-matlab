function [pndS, pndL]=calcpnd(partdist,radiiS,radiiL,dim)
    pndS = 0;
    pndL = 0;
    if (dim == 2)
        for i = -5:5
            for j = -5:5
                qdist = power(i*partdist,2) + power(j*partdist,2);  %quadratic distance between particles
                reL = radiiL*partdist;                              %max distance of particles considered in lambda
                reS = radiiS*partdist;
                qreL = power(reL,2);
                qreS = power(reS,2);
                if (qdist < qreL && qdist > 0)
                    dist = sqrt(qdist);                             %distance between particles
                    wL = reL/dist - 1;                              %weight of particle
                    pndL = wL + pndL;
                    if (qdist < qreS && qdist > 0)
                        dist = sqrt(qdist);                             %distance between particles
                        wS = reS/dist - 1;                              %weight of particle
                        pndS = wS + pndS;
                    end
                end
            end
        end
    elseif (dim == 3)
        for i = -5:5
            for j = -5:5
                for k=-5:5
                    qdist = power(i*partdist,2) + power(j*partdist,2) + power(k*partdist,2);  %quadratic distance between particles
                    reL = radiiL*partdist;                                %max distance of particles considered in lambda
                    reS = radiiS*partdist;
                    qreL = power(reL,2); 
                    qreS = power(reS,2);
                    if (qdist < qreL && qdist > 0)
                        dist = sqrt(qdist);                             %distance between particles
                        wL = reL/dist - 1;                                %weight of particle
                        pndL = wL + pndL;
                        if (qdist < qreS && qdist > 0)
                            dist = sqrt(qdist);                             %distance between particles
                            wS = reS/dist - 1;                                %weight of particle
                            pndS = wS + pndS;
                        end
                    end
                end
            end
        end
    end
end