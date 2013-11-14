function main
X=[1 2 4 3 4 8];
Y=[2 4 1 7 5 2];
figure(1); hold on;
plot(X, Y, 'ro');
n=length(X);
t(1) = 0;
for i=2:n
    t(i)=t(i-1)+norm([X(i) Y(i)] - [X(i-1) Y(i-1)]);
end
ttt=0:0.1:t(end);
FX=0; FY=0;
for j=1:n
    L=Lagranzo_daugianaris(t, j, ttt);
    FX=FX+L*X(j);
    FY=FY+L*Y(j);
end
plot(FX, FY, 'b-');
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