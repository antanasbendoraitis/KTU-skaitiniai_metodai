function main
syms fx fy t
fx = sin(t);
fy = cos(t);
T=0:0.05:10;
N=length(T);
figure(1); hold on; grid on; axis equal;
axis([-5 15 -5 15]);

h=[];
for i=1:N
    t=T(i);
    FX=eval(fx); FY=eval(fy);
    plot(T(i)+5, FY, 'b-', 'LineWIdth', 10);
    plot(FX, T(i)+5, 'r-', 'LineWIdth', 10);
    plot(FX, FY, 'm', 'LineWIdth', 10);
    pause(0.01);
end
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