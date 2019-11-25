function [part]=init(npart,grid,rho,nu,g)
    [yf]=colHeight(grid,npart,g);
    for i=1:npart
        grid.rho(i) = rho;
        grid.nu(i) = nu;
        if (g.x == -9.786966)
            grid.p(i) = abs((yf-grid.x(i))*g.x*grid.rho(i));
        elseif (g.y == -9.786966)
            grid.p(i) = abs((yf-grid.y(i))*g.y*grid.rho(i));
        elseif (g.z == -9.786966)
            grid.p(i) = abs((yf-grid.z(i))*g.z*grid.rho(i));
        end
        grid.ustar(i) = grid.u(i);
        grid.vstar(i) = grid.v(i);
        grid.wstar(i) = grid.w(i);
        grid.ax(i) = 0;
        grid.ay(i) = 0;
        grid.az(i) = 0;
    end
    part = grid;
end