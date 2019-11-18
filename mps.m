folder = "C:\Users\lucas_pereira.TPN2\Documents\mps\";
file = "2D_dam_1512.grid";
fileName = strcat(folder, file);

[npart, grid] = readGrid(fileName);
[lambda]=calcLambda(0.01,4);
[pnd]=calcpnd(0.01,4);