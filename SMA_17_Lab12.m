%kazkokia aproksimacija
function main
clc
close all
clear all
n=1000;
m=200;
T=4; dazniu_slenkstis=m; amplitudes_slenkstis=0;
dt=T/n;
N=1000;
dttt=T/N; ttt=-T:dttt:T; t=0:dt:T-dt;
fff=funk(T,t);
figure(1); hold on; plot(t,fff,'b-');
ac0=dot(fff, fc(0,T,t))/n;
for i=1:m-1
    ac(i)=dot(fff,fc(i,T,t))*2/n;
    as(i)=dot(fff,fs(i,T,t))*2/n;
end
figure(2); hold on;
bar(0:m-1, [ac0, sqrt(ac.^2+as.^2)], 0.01);
xx=axis; plot(xx(1:2), amplitudes_slenkstis*[1, 1], 'm--');
plot(dazniu_slenkstis*[1,1], xx(3:4), 'g--');
fffz=ac0*fc(0,T,ttt); dazniai=1:m-1;
dazniai=dazniai(dazniai<dazniu_slenkstis);
for i=dazniai
    if sqrt(ac.^2+as.^2) > amplitudes_slenkstis
        fffz=fffz+ac(i)*fc(i,T,ttt)+as(i)*fs(i,T,ttt);
    end
end
figure(3); hold on; plot(ttt, fffz, 'r-'); plot(t, fff, 'b-');

end

function f=funk(T, t)
f=sign(sin(2*pi*t/T))+sign(cos(2*pi*2*t/T))+sign(cos(2*pi*10*t/T));
return
end

function c=fc(i, T, t)
c=cos(2*pi*t*i/T);
return
end

function c=fs(i, T, t)
c=sin(2*pi*t*i/T);
return
end