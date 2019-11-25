function [neigh,nNeigh]=neighborhood(npart,part,maxNeigh,l0,rad,dim)
   neigh = zeros(npart*maxNeigh,1);
   nNeigh = zeros(npart,1);
   if (dim == 2)
       for i=1:npart
           for j=1:npart
               qdist = power(part(i).x-part(j).x,2) + power(part(i).y-part(j).y,2);
               re = rad*l0;
               qre = power(re,2);                                  
               if (qdist < qre && qdist > 0 && nNeigh(i) < maxNeigh)
                   nNeigh(i) = nNeigh(i) + 1;
                   neigh((i-1)*maxNeigh+nNeigh(i)) = j; 
               elseif (nNeigh(i) == maxNeigh)
                   disp("WARNING: Max number of neighboors exceeded");  
               end 
           end
       end
   elseif (dim == 3)
       for i=1:npart
           for j=1:npart
               qdist = power(part(i).x-part(j).x,2) + power(part(i).y-part(j).y,2) + power(part(i).z-part(j).z,2);
               re = rad*l0;
               qre = power(re,2);                                  
               if (qdist < qre && qdist > 0 && nNeigh(i) < maxNeigh)
                   nNeigh(i) = nNeigh(i) + 1;
                   neigh((i-1)*maxNeigh+nNeigh(i)) = j; 
               elseif (nNeigh(i) == maxNeigh)
                   disp("WARNING: Max number of neighboors exceeded");  
               end  
           end
       end
   end
end