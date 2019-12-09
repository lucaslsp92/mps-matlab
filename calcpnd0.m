function [pnd0]=calcpnd0(partdist,rad,dim)  %Arrumar, usando o pnd.m
    pnd0 = 0;
    if (dim == 2)
        for i = -5:5
            for j = -5:5
                qdist = power(i*partdist,2) + power(j*partdist,2);  %quadratic distance between particles
                re = rad*partdist;                                %max distance of particles considered in lambda
                qre = power(re,2);                                  
                if (qdist < qre && qdist > 0)
                    dist = sqrt(qdist);                             %distance between particles
                    w = re/dist - 1;                                %weight of particle
                    pnd0 = w + pnd0;
                end
            end
        end
    elseif (dim == 3)
        for i = -5:5
            for j = -5:5
                for k=-5:5
                    qdist = power(i*partdist,2) + power(j*partdist,2) + power(k*partdist,2);  %quadratic distance between particles
                    re = rad*partdist;                                %max distance of particles considered in lambda
                    qre = power(re,2);                                  
                    if (qdist < qre && qdist > 0)
                        dist = sqrt(qdist);                             %distance between particles
                        w = re/dist - 1;                                %weight of particle
                        pnd0 = w + pnd0;
                    end
                end
            end
        end
    end
end