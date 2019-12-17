function [part] = updatePosition(npart,part,dim,dt)
    if (dim == 2)  
        for i = 1:npart
            if (part.mat(i) == 0)             
                part.x(i) = part.x(i) + part.ustar(i)*dt;
                part.y(i) = part.y(i) + part.vstar(i)*dt;
            end
        end
    elseif (dim == 3)  
        for i = 1:npart
            if (part.mat(i) == 0)             
                part.x(i) = part.x(i) + part.ustar(i)*dt;
                part.y(i) = part.y(i) + part.vstar(i)*dt;
                part.z(i) = part.z(i) + part.wstar(i)*dt;
            end
        end
    end
end