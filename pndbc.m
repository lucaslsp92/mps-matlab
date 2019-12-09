function [part]=pndbc(npart,part,rad,l0,neigh,nNeigh,maxNeigh,dim,beta,pnd0)
    re = rad*l0;
    if (dim == 2)    
        for i=1:npart
            if (part.mat(i) == 3)
                part.bc(i) = -1;
            else
                for k=1:nNeigh(i)
                    j = neigh((i-1)*maxNeigh+k);
                    dist = sqrt(power(part.x(i)-part.x(j),2) + power(part.y(i)-part.y(j),2));
                    w = re/dist - 1;
                    part.pnd(i) = w + part.pnd(i);
                end
                if (part.pnd(i) > beta * pnd0)
                    part.bc(i) = 1;
                else
                    part.bc(i) = 0;
                end
            end
        end
    elseif (dim == 3)    
        for i=1:npart
            if (part.mat(i) == 3)
                part.bc(i) = -1;
            else
                for k=1:nNeigh(i)
                    j = neigh((i-1)*maxNeigh+k);
                    dist = sqrt(power(part.x(i)-part.x(j),2) + power(part.y(i)-part.y(j),2) + power(part.z(i)-part.z(j),2));
                    w = re/dist - 1;
                    part.pnd(i) = w + part.pnd(i);
                end
                if (part.pnd(i) > beta * pnd0)
                    part.bc(i) = 1;
                else
                    part.bc(i) = 0;
                end
            end
        end
    end
end