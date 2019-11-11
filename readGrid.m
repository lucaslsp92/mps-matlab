function [npart,grid]=readGrid(fileName)
    fileID = fopen(fileName,'r');
    fscanf(fileID,'%f',1);
    npart = fscanf(fileID,'%d',1);
    grid = zeros(npart,9);
    for i=1:npart
        grid(i,1) = fscanf(fileID, '%d',1);
        grid(i,2) = fscanf(fileID, '%f',1);
        grid(i,3) = fscanf(fileID, '%f',1);
        grid(i,4) = fscanf(fileID, '%f',1);
        grid(i,5) = fscanf(fileID, '%f',1);
        grid(i,6) = fscanf(fileID, '%f',1);
        grid(i,7) = fscanf(fileID, '%f',1);
        grid(i,8) = fscanf(fileID, '%f',1);
        grid(i,9) = fscanf(fileID, '%f',1);
    end
    fclose(fileID);
end