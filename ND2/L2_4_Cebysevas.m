function L2_4_Cebysevas
    clc, clear all, close all
    fprintf(1, 'Interpoliavimo mazgai:');
    X=[-2.0 -1.5 -1.0 -0.5 0 0.5 1.0 1.5 2.0 2.5 3.0]
	Y=[0 0.04 0.31 0.29 0 0.48 0.93 0.29 -0.06 0 0]
    n = length(X);

    T = zeros(n, n);

    for i=1:n
        T(i,1) = 1;
        T(i,2) = X(i);
        for j=3:n
            T(i,j) = 2 * X(i) * T(i,j-1) - T(i,j-2);
        end
    end
    fprintf(1, 'Baziniu funkciju reiksmes interpoliavimo mazguose:');
    T
    fprintf(1, 'Ciobysevo interpoliacines israiskos koeficientai:');
    a = flipud(T\Y')

    figure(1), hold on, grid on, axis equal
    plot(X,Y,'ro','MarkerFaceColor','r')

    XC=min(X):(max(X)-min(X))/(n*91):max(X);
    YC = klensou(a,XC);

    plot(XC,YC,'b-');
    legend('Interpoliavimo mazgai','Interpoliacine f-ja');
return
end

function px=klensou(a,x)
n=numel(a);
bk2=0; bk1=0;
for k=1:n
    bk=a(k)+2*x.*bk1-bk2;
    bk2=bk1; bk1=bk;
end;
px=bk-x.*bk2;
return
end