function lagranzo
clc, close all, clear all
X=[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3];
Y=[0 0.04 0.31 0.29 0 0.48 0.93 0.29 -0.06 0 0];

n=length(X);
figure(1); hold on, grid on;  

a=min(X);b=max(X); nnn=1000;
xxx=[a:(b-a)/(nnn-1):b];

figure(1); hold on, grid on;  
yyy = Lagranzo_interpoliacija(X,Y,xxx);
plot(xxx,yyy,'b-');

plot(X,Y,'ko','MarkerFaceColor','y');
return
end

function L=Lagrange(X,j,xxx)
    % X - inperpoliavimo abscises
    % j - L.d. numeris
    % xxx - vaizdavimo abscises    
    n=length(X);
    L=1;    
    for i=1:n
       if i ~= j ,L=L.*(xxx-X(i))/(X(j)-X(i)); end
    end
return 
end

function yyy=Lagranzo_interpoliacija(X,Y,xxx)
   n=length(X);
    yyy=0;
    for i=1:n        
        L=Lagrange(X,i,xxx); 
        yyy=yyy+L*Y(i);
    end
return
end