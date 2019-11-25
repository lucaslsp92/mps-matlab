dim = 2;                %dimens�o 2 ou 3
gravx = 0;              %gravidade na dire��o x
gravy = -9.786966;      %gravidade na dire��o y
gravz = 0;              %gravidade na dire��o z
visc = power(10,-6);    %viscosidade do flu�do
dens = power(10,3);     %densidade do flu�do

time = 10;              %tempo de simula��o
step = 0.001;           %tempo entre cada passo
print = 0.01;           %tempo entre cada impress�o

maxNeigh = 64;          %maximo numero de vizinhos
small = 2.1;            %raio de busca de vizinhan�a pequena
large = 4.0;            %raio de busca de vizinhan�a grande
partDist = 0.01;         %dist�ncia entre part�culas

surfBeta = 0.98;        %parametro de sup. livre
surfDelta = 0.2;        %parametro de sup. livre

folder = "C:\Users\lucas_pereira.TPN2\Documents\mps\";
file = "2D_dam_1512.grid";
fileName = strcat(folder, file);

[npart, part] = readGrid(fileName);
[lambda]=calcLambda(partDist,large,dim);
[pnd0]=calcpnd0(partDist,large,dim);