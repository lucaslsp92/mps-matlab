function [Acc]=calcAcc(npart, gravx, gravy, gravz, dim, lambda, pnd0_large, ID, Pos, Vel, pnd_small, press, partdist, radiiS, radiiL)
    for i = 1:npart
        Acc(i,1) = gravx;
        Acc(i,2) = gravy;
        Acc(i,3) = gravz;
    end
    if (dim == 2)  
        k = 2*dim/(pnd0_large*lambda);
        for i = 1:npart
            somaVx = 0;
            somaVy = 0;
            Wij = 0;
            for j = 1:npart
                qdist = power(Pos(j,1)-Pos(i,1),2) + power(Pos(j,2)-Pos(i,2),2);  %quadratic distance between particles
                qre = power(radiiL*partdist,2); 
                if (qdist < qre && qdist > 0)
                    somaVx = somaVx + (Vel(j,1)-Vel(i,1));
                    somaVy = somaVy + (Vel(j,2)-Vel(i,2));
                    Wij = Wij + (sqrt(qre)/sqrt(qdist) - 1);
                end
            end
            
            Acc(i,1) = Acc(i,1) + k*somaVx*(sqrt(qre)/sqrt(qdist) - 1);
            Acc(i,2) = Acc(i,2) + k*somaVy*(sqrt(qre)/sqrt(qdist) - 1);
        end
    end
end
        
    
    
