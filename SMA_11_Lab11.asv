function main
%X = [0 0.2 3 4 9 10.5 14 14.5];
%Y = [0.2 1 1.2 3 3 1.2 1 0.2];
xmin = -2; xmax = 2; np=10;
X=xmin:(xmax-xmin)/(np-1):xmax;
Y=
k = 0:np-1;
XC = (xmax+xmin)/2+(xmax-xmin)/2*cos((2*k+1)*pi/(2*np));
YC = 
x = min(X) : (max(X)-min(X))/100:max(X);
n=length(X);
figure(1); hold on;
plot(X, Y, 'ro');
F=0;
for j=1:n
    L=Lagranzo_daugianaris(X, j, x);
    F=F+L*Y(j);
end
plot(x, F);
end

function L=Lagranzo_daugianaris(X, j, x)
n=length(X);
L=1;
for i=1:n
    if i~=j
        L=L.*(x-X(i))/X(j)-X(i);
    end
end
return
end