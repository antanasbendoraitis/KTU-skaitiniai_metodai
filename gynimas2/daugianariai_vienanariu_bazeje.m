%Tautvydas Petkus IFF-1
function main
clc,close all,clear all
xmin = -10; 
xmax = 0;   
npower=5;
m = 3;
n=2^9-1;
SX = [xmin:(xmax-xmin)/(npower-1):xmax]
SY= fnk(SX)
a=min(SX);b=max(SX);t=[a:(b-a)/n:b];
fff=fnk(t);
 
d=zeros();
for m=3:npower
G=base(m,SX);
c=(G'*G)\(G'*SY');
sss=sprintf('%5.2g',c(1));
for i=1:m-1
    sss=[sss,sprintf('+%5.2gx^%1d',c(i+1),i)]
end
sss=strrep(sss,'+-','-');
nnn=200;
tmin=min(SX);tmax=max(SX);
ttt=[tmin:(tmax-tmin)/(nnn-1):tmax]; 
Gv=base(m,ttt);
fff1=Gv*c;
figure(m); hold on,grid on
plot(SX,SY, 'ro'); 
plot(t,fff,'r');  
plot(ttt,fff1,'--');
legend({'pradiniai taskai', 'g(x)', sprintf('f(x)=%s',sss),})
title(sprintf('task sk %d,  funkciju sk  %d',npower,m));
end
end
 
function G=base(m,x)
     for i=1:m,  G(:,i)=x.^(i-1); end
return
end
 
function rez=fnk(x)
    rez = 2*x.*sin(x) - (x./2 + 2).^2;
return, end
