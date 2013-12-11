function daugianariai
clc,close all,clear all
xmin = -5;  
xmax = 5;  
npower=9;
m = 3;
n=2^9-1;
SX = [xmin:(xmax-xmin)/(npower-1):xmax]
SY= fnk(SX)
a=min(SX);b=max(SX); t=[a:(b-a)/n:b];
fff=fnk(t);
d=zeros();
% Maziausiø kvadratø metodo lygèiø sistema:
for m=3:npower
G=base(m,SX);
c=(G'*G)\(G'*SY');
sss=sprintf('%5.2g',c(1));
for i=1:m-1
    sss=[sss,sprintf('+%5.2gx^%1d',c(i+1),i)];
end
sss=strrep(sss,'+-','-')
nnn=200; %vaizdavimo taðkø skaièius
tmin=min(SX);tmax=max(SX);
ttt=[tmin:(tmax-tmin)/(nnn-1):tmax]; %vaizdavimo taðkai 
Gv=base(m,ttt);
fff1=Gv*c;
figure(m); axis equal,hold on,grid off
plot(SX,SY, 'go'); 
plot(t,fff,'r');  
plot(ttt,fff1,'--');
legend({'duoti taskai', 'g(x)', 'f(x)'})
title(sprintf('aproksimavimas maziausiu kvadratu metodu \n  tasku skaicius %d,  funkciju skaicius  %d',npower,m));
d(m)=paklaida(fff1, SX, SY, ttt);
end
d
figure(m+1);hold on,grid on
plot([3:1:npower], d(3:end), '--rs', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
title('Paklaidos dydis, kai aproksimuojamø taðkø skaièius=9');
end

function G=base(m,x)
     for i=1:m,  G(:,i)=x.^(i-1); end
return
end

function d=paklaida(fff, SX, SY, ttt)
    d = 0;
    y = interp1(ttt, fff, SX);
    for j=1:length(y)
        d = d + (y(j) - SY(j)).^2;
    end
    d = d/2;
return
end

function rez=fnk(x)
   rez = exp(-x) .* cos(x) ./ (x - 6);
return, end
