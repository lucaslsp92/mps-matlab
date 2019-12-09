function [npart,ID, Pos, Vel, pnd_small, press]=readGrid(fileName)
    fileID = fopen(fileName,'r');
    fscanf(fileID,'%f',1);
    npart = fscanf(fileID,'%d',1);
    ID = zeros(npart,1);
    Pos = zeros(npart,3);
    Vel = zeros(npart,3);
    pnd_small = zeros(npart,1);
    press = zeros(npart,1);
    for i=1:npart
        ID(i,1) = fscanf(fileID, '%d',1);
        Pos(i,1) = fscanf(fileID, '%f',1);
        Pos(i,2) = fscanf(fileID, '%f',1);
        Pos(i,3) = fscanf(fileID, '%f',1);
        Vel(i,1) = fscanf(fileID, '%f',1);
        Vel(i,2) = fscanf(fileID, '%f',1);
        Vel(i,3) = fscanf(fileID, '%f',1);
        pnd_small(i,1) = fscanf(fileID, '%f',1);
        Press(i,1) = fscanf(fileID, '%f',1);
    end
    fclose(fileID);
end