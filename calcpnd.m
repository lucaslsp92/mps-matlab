function [pnd]=calcpnd(partdist,radii)
    pnd = 0;
    for i = -5:5
        for j = -5:5
            qdist = power(i*partdist,2) + power(j*partdist,2);  %quadratic distance between particles
            re = radii*partdist;                                %max distance of particles considered in lambda
            qre = power(re,2);                                  
            if (qdist < qre && qdist > 0)
                dist = sqrt(qdist);                             %distance between particles
                w = re/dist - 1;                                %weight of particle
                pnd = w + pnd;
            end
        end
    end
end