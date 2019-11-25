function [npart,part]=readGrid(fileName)
    fileID = fopen(fileName,'r');
    fscanf(fileID,'%f',1);
    npart = fscanf(fileID,'%d',1);
    for i=1:npart
        part(i).mat = fscanf(fileID, '%d',1);
        part(i).x = fscanf(fileID, '%f',1);
        part(i).y = fscanf(fileID, '%f',1);
        part(i).z = fscanf(fileID, '%f',1);
        part(i).u = fscanf(fileID, '%f',1);
        part(i).v = fscanf(fileID, '%f',1);
        part(i).w = fscanf(fileID, '%f',1);
        part(i).pnd = fscanf(fileID, '%f',1);
        part(i).p = fscanf(fileID, '%f',1);
    end
    fclose(fileID);
end