function niutonas
clc, clear all, close all
display('***Interpoliavimas vienanariu per duotus taskus Niutono bazeje***');
display('Interpoliavimo mazgai:');
X = [ 1.0000    1.6000    2.2000    2.8000    3.4000    4.0000    4.6000 ]
Y = [ 0.2273   -0.0086   -0.0929   -0.0437    0.0255    0.0396    0.0071 ]
x = min(X):(max(X)-min(X))/10:max(X);
n=length(X);

figure(1), hold on, grid on, axis equal
plot(X,Y,'ro')
 n = size(X, 2);
 

for i=1:n-1
    t=X(i):0.01:X(i+1);
    a=niuton(X,Y,t);
    plot(t,a,'g-')
    title 'Interpoliavimas Niutono bazëje'
end

return
end

function fv=niuton(x,y,t) 
% NIUTON apskaiciuoja interpoliacinio polinomo,  
% nusakyto interpoliavimo taskais (x(i),y(i)),i=1,2,...,n+1), 
% reiksmes fv, kai argumento reiksmes apibrezia masyvo t elementai. 
% Polinomo reiksmes skaiciuojamos pagal Niutono iterpoliacine forma. 
% iejimo parametrai 
% (x,y)     - interpoliavimo taskai, 
%  t        - argumento reiksme masyvas. 
% Isejimo parametrai 
% fv       - interpoliacinio polinomo reiksmes. 
 
n=numel(x)-1;
m=numel(t); 
[k,l]=size(t);
if k ==1 
  t=t'; 
end 
[k,l]=size(x); 
if k ~=1 
  x=x'; y=y'; 
end 
d=y; 
for i=1:length(x)
        matrica(i,1) = 1;
        for j=2:length(x)
            if i >= j
                skaicius = 1;
                for y=1:j-1
                    skaicius = skaicius*(x(i)-x(y));
                end
                matrica(i,j) = skaicius;
            else
                matrica(i,j) = 0;
            end
        end
    end
    matrica
for k=1:n 
    h=x(k+1:end)-x(1:end-k); 
    tt=(d(k+1:end)-d(k:end-1))./h; 
    d(k+1:end)=tt; 
end 
xx=repmat(x,m,1);dd=repmat(d,m,1);tt=repmat(t,1,n); 
p=tt-xx(:,1:end-1);r=ones(m,1);s=[r cumprod(p,2)]; 
fv=sum((dd.*s)');
return
end