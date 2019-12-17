function [part]=calcAcc(npart,part,g,dim,lambda,nNeigh,neigh,dt,maxNeigh,rad,l0)
    re = rad*l0;
    if (dim == 2)  
        for i = 1:npart
            part.laplx(i) = 0;
            part.laply(i) = 0;
            ni = 0;
            su = 0;
            sv = 0;
            if (part.mat(i) == 0)
                part.ax(i) = g.x;
                part.ay(i) = g.y;
                
                for j = 1:nNeigh(i)
                    m = neigh((i-1)*maxNeigh+j);
                    dist = sqrt(power(part.x(i)-part.x(m),2) + power(part.y(i)-part.y(m),2));
                    w = re/dist - 1;
                    su = su + (part.u(m)-part.u(i))*w;
                    sv = sv + (part.v(m)-part.v(i))*w;
                    ni = ni + w;
                 end
                part.laplx(i) = ((2*dim)/(lambda*ni))*su;
                part.laply(i) = ((2*dim)/(lambda*ni))*sv;
                
                part.ustar(i) = part.u(i)+dt*((part.nu(i)/part.rho(i))*part.laplx(i)+part.ax(i)/part.rho(i));
                part.vstar(i) = part.v(i)+dt*((part.nu(i)/part.rho(i))*part.laply(i)+part.ay(i)/part.rho(i));
            end
        end
    elseif (dim == 3)  
        for i = 1:npart
            part.laplx(i) = 0;
            part.laply(i) = 0;
            part.laplz(i) = 0;
            ni = 0;
            su = 0;
            sv = 0;
            sw = 0;
            if (part.mat(i) == 0)
                part.ax(i) = g.x;
                part.ay(i) = g.y;
                part.az(i) = g.z;
            
                for j = 1:nNeigh(i)
                    m = neigh((i-1)*maxNeigh+j);
                    dist = sqrt(power(part.x(i)-part.x(m),2) + power(part.y(i)-part.y(m),2));
                    w = re/dist - 1;
                    su = su + (part.u(m)-part.u(i))*w;
                    sv = sv + (part.v(m)-part.v(i))*w;
                    sw = sw + (part.w(m)-part.w(i))*w;
                    ni = ni + w;
                 end
                part.laplx(i) = ((2*dim)/(lambda*ni))*su;
                part.laply(i) = ((2*dim)/(lambda*ni))*sv;
                part.laplz(i) = ((2*dim)/(lambda*ni))*sw;
                
                part.ustar(i) = part.u(i)+dt*((part.nu(i)/part.rho(i))*part.laplx(i)+part.ax(i)/part.rho(i));
                part.vstar(i) = part.v(i)+dt*((part.nu(i)/part.rho(i))*part.laply(i)+part.ay(i)/part.rho(i));
                part.wstar(i) = part.w(i)+dt*((part.nu(i)/part.rho(i))*part.laplz(i)+part.az(i)/part.rho(i));
            end
        end
    end
end