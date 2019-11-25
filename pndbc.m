function [part]=pndbc(npart,part,rad,l0,neigh,nNeigh,maxNeigh,dim,beta,pnd0)
    re = rad*l0;
    if (dim == 2)    
        for i=1:npart
            if (part(i).mat == 3)
                part(i).bc = -1;
            else
                for k=1:nNeigh(i)
                    j = neigh((i-1)*maxNeigh+k);
                    dist = sqrt(power(part(i).x-part(j).x,2) + power(part(i).y-part(j).y,2));
                    w = re/dist - 1;
                    part(i).pnd = w + part(i).pnd;
                end
                if (part(i).pnd > beta * pnd0)
                    part(i).bc = 1;
                else
                    part(i).bc = 0;
                end
            end
        end
    end
end