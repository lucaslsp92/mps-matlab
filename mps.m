dim = 2;                %dimensão 2 ou 3
gravx = 0;              %gravidade na direção x
gravy = -9.786966;      %gravidade na direção y
gravz = 0;              %gravidade na direção z
visc = power(10,-6);    %viscosidade do fluído
dens = power(10,3);     %densidade do fluído

time = 10;              %tempo de simulação
step = 0.001;           %tempo entre cada passo
print = 0.01;           %tempo entre cada impressão

maxNeigh = 64;          %maximo numero de vizinhos
small = 2.1;            %raio de busca de vizinhança pequena
large = 4.0;            %raio de busca de vizinhança grande
partDist = 0.01;         %distância entre partículas

surfBeta = 0.98;        %parametro de sup. livre
surfDelta = 0.2;        %parametro de sup. livre

folder = "C:\Users\lucas_pereira.TPN2\Documents\mps\";
file = "2D_dam_1512.grid";
fileName = strcat(folder, file);

[npart, part] = readGrid(fileName);
[lambda]=calcLambda(partDist,large,dim);
[pnd0]=calcpnd0(partDist,large,dim);