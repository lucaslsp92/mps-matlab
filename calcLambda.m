function [lambda]=calcLambda(partdist,large,dim)
    dd = 0;                %sum of dividend of lambda
    ds = 0;                %sum of divisor of lambda
    
    if (dim == 2)
        for i = -5:5
            for j = -5:5
                qdist = power(i*partdist,2) + power(j*partdist,2);  %quadratic distance between particles
                re = large*partdist;                                %max distance of particles considered in lambda
                qre = power(re,2);                                  
                if (qdist < qre && qdist > 0)
                    dist = sqrt(qdist);                             %distance between particles
                    w = re/dist - 1;                                %weight of particle
                    dd = qdist*w + dd;
                    ds = w + ds;
                end
            end
        end
        lambda = dd/ds;
    elseif (dim == 3)
        for i = -5:5
            for j = -5:5
                for k = -5:5
                    qdist = power(i*partdist,2) + power(j*partdist,2) + power(k*partdist,2);  %quadratic distance between particles
                    re = large*partdist;                                %max distance of particles considered in lambda
                    qre = power(re,2);                                  
                    if (qdist < qre && qdist > 0)
                        dist = sqrt(qdist);                             %distance between particles
                        w = re/dist - 1;                                %weight of particle
                        dd = qdist*w + dd;
                        ds = w + ds;
                    end
                end
            end
        end
        lambda = dd/ds;
    end
end