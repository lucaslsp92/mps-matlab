function [part]=init(npart,grid,rho,nu,g)
    [yf]=colHeight(grid,npart,g);
    for i=1:npart
        grid(i).rho = rho;
        grid(i).nu = nu;
        if (g.x == -9.786966)
            grid(i).p = abs((yf-grid(i).x)*g.x*grid(i).rho);
        elseif (g.y == -9.786966)
            grid(i).p = abs((yf-grid(i).y)*g.y*grid(i).rho);
        elseif (g.z == -9.786966)
            grid(i).p = abs((yf-grid(i).z)*g.z*grid(i).rho);
        end
        grid(i).ustar = grid(i).u;
        grid(i).vstar = grid(i).v;
        grid(i).wstar = grid(i).w;
        grid(i).ax = 0;
        grid(i).ay = 0;
        grid(i).az = 0;
    end
    part = grid;
end