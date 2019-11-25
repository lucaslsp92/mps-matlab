function [yf]=colHeight(grid,npart,g)
    yf = 0;
    if (g.x == -9.786966)
        for i=1:npart
            if (grid.mat(i) == 0)
                yf = max(yf,grid.x(i));
            end
        end
    elseif (g.y == -9.786966)
        for i=1:npart
            if (grid.mat(i) == 0)
                yf = max(yf,grid.y(i));
            end
        end
    elseif (g.z == -9.786966)
        for i=1:npart
            if (grid.mat(i) == 0)
                yf = max(yf,grid.z(i));
            end
        end
    end
end