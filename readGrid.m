function [npart,part]=readGrid(fileName)
    fileID = fopen(fileName,'r');
    fscanf(fileID,'%f',1);
    npart = fscanf(fileID,'%d',1);
    for i=1:npart
        part.mat(i) = fscanf(fileID, '%d',1);
        part.x(i) = fscanf(fileID, '%f',1);
        part.y(i) = fscanf(fileID, '%f',1);
        part.z(i) = fscanf(fileID, '%f',1);
        part.u(i) = fscanf(fileID, '%f',1);
        part.v(i) = fscanf(fileID, '%f',1);
        part.w(i) = fscanf(fileID, '%f',1);
        part.pnd(i) = fscanf(fileID, '%f',1);
        part.p(i) = fscanf(fileID, '%f',1);
    end
    fclose(fileID);
end