d = 2;                %dimens�o 2 ou 3
g.x = 0;              %gravidade na dire��o x
g.y = -9.786966;      %gravidade na dire��o y
g.z = 0;              %gravidade na dire��o z
nu = power(10,-6);    %viscosidade do flu�do
rho = power(10,3);     %densidade do flu�do

t.end = 10;              %tempo de simula��o
t.step = 0.001;           %tempo entre cada passo
t.print = 0.01;           %tempo entre cada impress�o

maxNeigh = 64;          %maximo numero de vizinhos
r.small = 2.1;            %raio de busca de vizinhan�a pequena
r.large = 4.0;            %raio de busca de vizinhan�a grande
l0 = 0.01;         %dist�ncia entre part�culas

surf.Beta = 0.98;        %parametro de sup. livre
surf.Delta = 0.2;        %parametro de sup. livre

folder = "E:\Users\Lucas\Onedrive\Estudos\Mestrado\Pesquisas\Programas\matlab-mps\mps\";
file = "2D_dam_1512.grid";
fileName = strcat(folder, file);

[npart, grid] = readGrid(fileName);
[lambda]=calcLambda(l0,r.large,d);
[pnd0S, pnd0L]=calcpnd0(l0,r.small,r.large,d);
[part]=init(npart,grid,rho,nu,g);
[neigh,nNeigh]=neighborhood(npart,part,maxNeigh,l0,r.small,d);
[part]=pndbc(npart,part,r.small,l0,neigh,nNeigh,maxNeigh,d,surf.Beta,pnd0S);

[part]=calcAcc(npart,part,g,d,lambda,nNeigh,neigh,t.step,maxNeigh,r.large,l0);
[part]=updatePosition(npart,part,d,t.step);


scatter(part.x,part.y,l0*10000,part.pnd,'filled');
