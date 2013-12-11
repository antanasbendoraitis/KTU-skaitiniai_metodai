function main
clc,close all
hL=[];

X=[-0.96 -0.3 0.36 0.09 0.09 0.36 -0.3 -0.96];
Y=[-0.28 0.65 0.23 -0.11 0.11 -0.23 -0.65 0.28];

nP=length(X);  % interpoliavimo mazgu skaicius
t(1)=0; for i=2:nP, t(i)=t(i-1)+norm([X(i) Y(i)]-[X(i-1) Y(i-1)]);  end
t

DX=Akima(t,X),DY=Akima(t,Y) % apskaièiuoja iðvestines
f=figure(1), hold on, grid on, axis([min(X)-0.1,max(X)+0.1,min(Y)-0.1,max(Y)+0.1]);
title('Interpoliavimas Ermito splainais','FontWeight','b');

for i=1:nP, % vaizduojame duotus taskus
    h(i)=plot(X(i), Y(i),'ko','MarkerSize',10);
end
Ermito_splainu_parametrinis_interpoliavimas(X,DX,Y,DY,t);

% parametrinis funkcijos vaizdavimas 
xmin=-5; xmax=5; n=9;
t=[xmin:(xmax-xmin)/(n-1):xmax]
X=funkcijaX(t), Y=funkcijaY(t)
figure(2);
p1 = plot(t, X,'go', 'color','r','LineWidth', 1);
hold on; grid on;
p2 = plot(t, Y,'go', 'color','b','LineWidth', 1);
tt=[xmin:(xmax-xmin)/((n-1)*20):xmax];
plot(tt,funkcijaX(tt),'g-');
plot(tt,funkcijaY(tt),'b-');
legend('','','X(t)','Y(t)');
xlabel('t','FontSize',12);
ylabel('X(t), Y(t)','FontSize',12);
title('Parametrinis funkcijos vaizdavimas','FontWeight','b');
legend([p1,p2],'X(t)','Y(t)',1); hold off;
                                            
function Ermito_splainu_parametrinis_interpoliavimas(X,DX,Y,DY,t);
    nP=length(X); % interpoliavimo taðkø skaicius
    if ~isempty(hL), delete(hL); end

    for ii=1:nP-1  %ciklas per gretimø taðkø intervalus
        tikslumas=100; 
        taskai=[t(ii):(t(ii+1)-t(ii))/tikslumas:t(ii+1)];
        fX=0; fY=0;
        for j=1:2
            [U,V]=Hermite(t(ii:ii+1),j,taskai);
            fY=fY+U*Y(ii+j-1)+V*DY(ii+j-1);
            fX=fX+U*X(ii+j-1)+V*DX(ii+j-1);
        end
        hL(ii)=plot(fX,fY,'r-','LineWidth',2);
    end
return
end

function [U,V]=Hermite(X,j,x) % Ermito daugianariai
    L=Lagrange(X,j,x); DL=D_Lagrange(X,j,X(j));
    U=(1-2*DL.*(x-X(j))).*L.^2;
    V=(x-X(j)).*L.^2;
return
end

function L=Lagrange(X,j,x) % Lagranþo daugianaris
    n=length(X);    
    L=1;
    for k=1:n, if k ~= j, L=L.*(x-X(k))/(X(j)-X(k)); end, end
return
end

function DL=D_Lagrange(X,j,x) % Lagranþo daugianario iðvestinë pagal x
    n=length(X);    
    DL=0; %DL iðraiðkos skaitiklis
    for i=1:n % ciklas per atmetamus narius
        if i==j, continue, end 
        Lds=1;
        for k=1:n, if k ~= j && k ~= i , Lds=Lds.*(x-X(k)); end, end
        DL=DL+Lds;
    end
    Ldv=1; %DL iðraiðkos vardiklis 
    for k=1:n, if k ~= j, Ldv=Ldv.*(X(j)-X(k)); end ,    end
    DL=DL/Ldv;
return
end

function DY=Akima(X,Y)
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

function funkX=funkcijaX(x)
funkX=(x/5).*sin(x);
return, end
 
function funkY=funkcijaY(x)
funkY=(x/5).*cos(x);
return, end

end