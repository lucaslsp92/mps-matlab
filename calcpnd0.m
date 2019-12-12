function [pnd0S, pnd0L]=calcpnd0(partdist,radiiS, radiiL,dim)  
    pnd0S = 0;
    pnd0L = 0;
    if (dim == 2)
        for i = -5:5
            for j = -5:5
                qdist = power(i*partdist,2) + power(j*partdist,2);  %quadratic distance between particles
                reS = radiiS*partdist;                                %max distance of particles considered in lambda
                reL = radiiL*partdist;
                qreS = power(reS,2);   
                qreL = power(reL,2);
                if (qdist < qreL && qdist > 0)
                    dist = sqrt(qdist);                             %distance between particles
                    wL = reL/dist - 1;                                %weight of particle
                    pnd0L = wL + pnd0L
                    if (qdist < qreS && qdist > 0)
                        dist = sqrt(qdist);                             %distance between particles
                        wS = reS/dist - 1;                                %weight of particle
                        pnd0S = wS + pnd0S
                    end
                end
            end
        end
    elseif (dim == 3)
        for i = -5:5
            for j = -5:5
                for k=-5:5
                    qdist = power(i*partdist,2) + power(j*partdist,2) + power(k*partdist,2);  %quadratic distance between particles
                    reS = radiiS*partdist;                                %max distance of particles considered in lambda
                    reL = radiiL*partdist;
                    qreS = power(reS,2);   
                    qreL = power(reL,2);                                
                    if (qdist < qreL && qdist > 0)
                        dist = sqrt(qdist);                             %distance between particles
                        wL = reL/dist - 1;                                %weight of particle
                        pnd0L = wL + pnd0L;
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