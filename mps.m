dim = 2              %dimens�o 2 ou 3
gravx = 0            %gravidade na dire��o x
gravy = -9.786966    %gravidade na dire��o y
gravz = 0            %gravidade na dire��o z
visc = 10**-6        %viscosidade do flu�do
dens = 10**3         %densidade do flu�do

time = 10            %tempo de simula��o
step = 0.001         %tempo entre cada passo
print = 0.01         %tempo entre cada impress�o

npart = 1500         %n�mero de part�culas
partdist = 0.1       %dist�ncia entre part�culas

folder = "C:\Users\lucas_pereira.TPN2\Documents\mps\";
file = "2D_dam_1512.grid";
fileName = strcat(folder, file);

[npart, grid] = readGrid(fileName);
[lambda]=calcLambda(0.01,4);
[pnd]=calcpnd(0.01,4);