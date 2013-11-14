function main
clc, close all
syms x f
f=sin(x);
df=diff(f);
np=7;
xrange=[-pi; pi];
X=xrange(1):(xrange(2) - xrange(1))/(np-1):xrange(2);
xxx=xrange(1):(xrange(2) - xrange(1))/100:xrange(2);
F=eval(subs(f, x, X));
DF=eval(subs(df, x, X));
n=length(X);
figure(1); hold on; plot(X, F, 'ro');
fff=0;
for j=1:n
    [U,V]= Ermito_daugianariai(X, j, xxx);
    fff=fff+U*F(j)+V*DF(j);
end
plot(xxx, fff, 'b-');
plot(xxx, eval(subs(f, x, sym(xxx))), 'r-');
end

function [U, V]=Ermito_daugianariai(X, j, x)
    L=Lagranzo_daugianaris(X, j, x);
    DL = D_Lagranzo_daugianaris(X, j, x);
    U=(1-2*DL.*(x-X(j))).*L.^2;
    V=(x-X(j)).*L.^2;
return
end

function DL=D_Lagranzo_daugianaris(X, j, x)
n=length(X);
DL=0;
for i=1:n
    if i==j, continue, end
    LDS=1;
    for k=1:n
        if k~=j && k~=i, LDS=LDS.*(x-X(k)); end
    end
    DL=DL+LDS;
end
LDV=1;
for k=1:n
    if k~=j,
        LDV=LDV.*(X(j)-X(k));
    end
end
return
end

function L=Lagranzo_daugianaris(X, j, x)
n=length(X);
L=1;
for i=1:n
    if i~=j
        L=L.*(x-X(i))/(X(j)-X(i));
    end
end
return
end