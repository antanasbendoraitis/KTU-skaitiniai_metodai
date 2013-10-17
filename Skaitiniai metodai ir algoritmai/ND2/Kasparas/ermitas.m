function main
clc,close all
hL=[];
 
X=[0 0.24 0.30 -0.43 -0.96 -0.04 1.41 1.09 -1.09]
Y=[0 0.08 -0.40 -0.62 0.28 1.25 0.52 -1.37 -1.68]
 
nP=length(X);  % interpoliavimo mazgu skaicius
t(1)=0; for i=2:nP, t(i)=t(i-1)+norm([X(i) Y(i)]-[X(i-1) Y(i-1)]);  end  % parametro reiksmes
t
 
DX=Akima(t,X),DY=Akima(t,Y)
 
f=figure(1);grid on; hold on;
title('Interpoliavimas Ermito splainais');
 
% vaizduojame duotus taskus
for i=1:nP, 
    h(i)=plot(X(i), Y(i),'ko','ButtonDownFcn',@startDragFcn,'MarkerSize',10);
end
 
 
% interpoliuojame pagal ivestus taskus ir 
% nubraizome pradine kreive
Ermito_splainu_parametrinis_interpoliavimas(X,DX,Y,DY,t);    
legend('Interpoliavimo taskai');
      
figure(2);
hold on; grid on;
handlers = [];
Akima_splainai(t,X,'r-');
Akima_splainai(t,Y,'b-');
 
title('Ermito splainai. Parametrinis funkcijos vaizdavimas.');
legend(handlers,'X(t)','Y(t)');
function Akima_splainai (X, Y, color)
DY=Akima(X,Y)  % Isvestiniu reiksmiu interpoliavimo taskuose nustatymas pagal Akima formules
nP=length(X) % interpoliavimo tasku skaicius
 
for iii=1:nP-1  
    nnn=100;
    xxx=[X(iii):(X(iii+1)-X(iii))/nnn:X(iii+1)];
    fff=0;
    for j=1:2
        [U,V]=Hermite(X(iii:iii+1),2,j,xxx);
        fff=fff+U*Y(iii+j-1)+V*DY(iii+j-1);
    end
    
    handler = plot(xxx,fff,color);
    if iii==1 || iii==2
    if strcmp(color,'r-')
        handlers(1)=handler;
    else
        handlers(2)=handler;
    end
    end
    plot(X, Y, 'ro');
    
end 
return
end
 
 
function Ermito_splainu_parametrinis_interpoliavimas(X,DX,Y,DY,t);
    nP=length(X); % interpoliavimo tasku skaicius
    if ~isempty(hL), delete(hL); end
 
    for iii=1:nP-1  %------  ciklas per intervalus tarp gretimu tasku
        nnn=100; 
        ttt=[t(iii):(t(iii+1)-t(iii))/nnn:t(iii+1)];
        fffX=0;fffY=0;
        for j=1:2
            [U,V]=Hermite(t(iii:iii+1),2,j,ttt);
            fffY=fffY+U*Y(iii+j-1)+V*DY(iii+j-1);
            fffX=fffX+U*X(iii+j-1)+V*DX(iii+j-1);
        end
        hL(iii)=plot(fffX,fffY,'r-','LineWidth',2.5);
    end %-----------------ciklas per intervalus pabaiga
return
end
 
function [U,V]=Hermite(X,n,j,x)   % Ermito daugianariai
    L=Lagrange(X,n,j,x); DL=D_Lagrange(X,n,j,X(j));
    U=(1-2*DL.*(x-X(j))).*L.^2;
    V=(x-X(j)).*L.^2;
return
end
 
function L=Lagrange(X,n,j,x)  % Lagranzo daugianaris
    L=1;
    for k=1:n, if k ~= j, L=L.*(x-X(k))/(X(j)-X(k)); end, end
return
end
 
function DL=D_Lagrange(X,n,j,x)  % Lagranzo daugianario isvestine pagal x
    DL=0; %DL israskos skaitiklis
    for i=1:n % ciklas per atmetamus narius
        if i==j, continue, end 
        Lds=1;
        for k=1:n, if k ~= j && k ~= i , Lds=Lds.*(x-X(k)); end, end
        DL=DL+Lds;
    end
    Ldv=1;   %DL israskos vardiklis 
    for k=1:n, if k ~= j, Ldv=Ldv.*(X(j)-X(k)); end ,    end
    DL=DL/Ldv;
return
end
 
function DY=Akima(X,Y)
% Isvestiniu reiksmiu interpoliavimo taskuose nustatymas pagal skaitinio integravimo formules
    n=length(X);
fnk=inline('(2*x-xi-xip1)/((xim1-xi)*(xim1-xip1))*yim1+(2*x-xim1-xip1)/((xi-xim1)*(xi-xip1))*yi+(2*x-xim1-xi)/((xip1-xim1)*(xip1-xi))*yip1')
    for i=1:n
        if i == 1,xim1=X(1);xi=X(2);xip1=X(3); yim1=Y(1);yi=Y(2);yip1=Y(3);DY(i)=fnk(xim1,xi,xim1,xip1,yi,yim1,yip1);
        elseif i == n, xim1=X(n-2);xi=X(n-1);xip1=X(n); yim1=Y(n-2);yi=Y(n-1);yip1=Y(n); DY(n)=fnk(xip1,xi,xim1,xip1,yi,yim1,yip1);
        else, xim1=X(i-1);xi=X(i);xip1=X(i+1); yim1=Y(i-1);yi=Y(i);yip1=Y(i+1); DY(i)=fnk(xi,xi,xim1,xip1,yi,yim1,yip1);
        end
    end
return
end
 
end 
