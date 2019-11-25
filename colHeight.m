function [yf]=colHeight(grid,npart,g)
    yf = 0;
    if (g.x == -9.786966)
        for i=1:npart
            if (grid(i).mat == 0)
                yf = max(yf,grid(i).x);
            end
        end
    elseif (g.y == -9.786966)
        for i=1:npart
            if (grid(i).mat == 0)
                yf = max(yf,grid(i).y);
            end
        end
    elseif (g.z == -9.786966)
        for i=1:npart
            if (grid(i).mat == 0)
                yf = max(yf,grid(i).z);
            end
        end
    end
end