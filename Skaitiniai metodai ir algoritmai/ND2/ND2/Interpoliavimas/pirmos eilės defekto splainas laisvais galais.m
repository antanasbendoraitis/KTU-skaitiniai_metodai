function Splainu_Interpoliacija_2D
clc,close all
syms  f x 
%Funkcijos
fx=(x/5)*sin(x);
fy=(x/5)*cos(5*x);
%Gaunamos X(T) Y(T)
nP=9; 
xrange=[0,3*pi];
%T paskirstomas tolygiai
T=[xrange(1):(xrange(2)-xrange(1))/(nP-1):xrange(2)];
X=eval(subs(fx,sym(x),sym(T)));
Y=eval(subs(fy,sym(x),sym(T)));
Interpoliacija(X, Y);
end

function Interpoliacija(X, Y)
hL=[]; 
f=figure; hold on; grid on
nP=length(X);
t(1)=0; 
for i=2:nP
    t(i)=t(i-1)+norm([X(i) Y(i)]-[X(i-1) Y(i-1)]); 
end

figure(1);axis([-3,3,-3,3]);axis equal;hold on;
% vaizduojame duotus taskus
for i=1:nP, 
    h(i)=plot(X(i), Y(i),'ko','ButtonDownFcn',@startDragFcn,'MarkerSize',10);
end
splainu_parametrinis_interpoliavimas(X,Y,t);  

function splainu_parametrinis_interpoliavimas(X,Y,t)
nP=length(X); % interpoliavimo tasku skaicius
if ~isempty(hL), delete(hL); end

DDFX=splaino_koeficientai(t,X);
DDFY=splaino_koeficientai(t,Y);

for iii=1:nP-1  %------  ciklas per intervalus tarp gretimu tasku

nnn=100;
[SX,sss]=splainas(t(iii:iii+1),X(iii:iii+1),DDFX(iii:iii+1),nnn);
[SY,sss]=splainas(t(iii:iii+1),Y(iii:iii+1),DDFY(iii:iii+1),nnn);
hL(iii)=plot(SX,SY,'k-','LineWidth',2,'MarkerSize',8);

end 
% splaino intervalu objektu valdikliai issaugomi masyve hL
return
end


function DDF=splaino_koeficientai(X,Y)
% apskaiciuojamos antros isvestines splaino mazguose
n=length(X);
A=zeros(n);b=zeros(n,1);
d=X(2:n)-X(1:(n-1));
 for i=1:n-2
     A(i,i:i+2)=[d(i)/6, (d(i)+d(i+1))/3,d(i+1)/6];
     b(i)=(Y(i+2)-Y(i+1))/d(i+1)-(Y(i+1)-Y(i))/d(i);
 end
A(n-1,1)=1;A(n,n)=1;
DDF=A\b;
return
end

function [S,sss]=splainas(X,Y,DDF,nnn)
% splaino intervale tarp dvieju tasku apskaiciavimas
% nnn - vaizdavimo tzku skaicius
% S - splaino reiksmes
% sss - vaizdavimo abscises
d=X(2)-X(1);
sss=X(1):(X(2)-X(1))/(nnn-1):X(2);
S=DDF(1)/2*(sss-X(1)).^2+(DDF(2)-DDF(1))/(6*d)*(sss-X(1)).^3+(sss-X(1))*((Y(2)-Y(1))/d-DDF(1)*d/3-DDF(2)*d/6) +Y(1);

return
end
legend({['Interpoliavimo koordinates']});
end  