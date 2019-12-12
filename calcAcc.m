function [Acc]=calcAcc(npart, part, g, dim, lambda, pnd0L, pnd0S, l0, radiiS, radiiL)
    for i = 1:npart
        Acc.x(i) = g.x;
        Acc.y(i) = g.y;
        Acc.z(i) = g.z;
    end
    if (dim == 2)  
        k = 2*dim/(pnd0L*lambda);
        for i = 1:npart
            somaVx = 0;
            somaVy = 0;
            Wij = 0;
            for j = 1:npart
                qdist = power(part.x(j)-part.x(i),2) + power(part.y(j)-part.y(i),2);  %quadratic distance between particles
                qre = power(radiiL*l0,2); 
                if (qdist < qre && qdist > 0)
                    somaVx = somaVx + (part.u(j)-part.u(i));
                    somaVy = somaVy + (part.v(j)-part.v(i));
                    Wij = Wij + (sqrt(qre)/sqrt(qdist) - 1);
                end
            end
            
            Acc.x(i) = Acc.x(i) + k*somaVx*(sqrt(qre)/sqrt(qdist) - 1);
            Acc.y(i) = Acc.y(i) + k*somaVy*(sqrt(qre)/sqrt(qdist) - 1);
        end
    end
end
        
    
    
