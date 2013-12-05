function L2_1_Furje
clc,close all,clear all
n=1000; % tasku skaicius
m=200;
M=2*m-1;    % m - harmoniku skaicius,M -koeficientu skaicius
if M > n, '*********per didelis harmoniku skaicius';end
T=4;		%periodas
slenkstis=0.25 ; % harmoniku amplitudziu slenkstis triuksmu filtravimu
dt=T/n;
N=1000; % vaizdavimo tasku skaicius
dttt=T/N;

t=[0:dt:T-dt];
ttt=[-T:dttt:2*T];

fff=fnk(T,t); % apskaiciuojame ir pavaizduojame duota tasku seka 
fffg=fnk2(T,t);
fff2=fnk2(T,ttt);

    figure(1),hold on,grid on, plot(t,fffg,'b.-'); 
    title('Grafikas be triuksmo. 0: T-dt')
    legend(sprintf('n=%d tasku, m=%d harmoniku',n,m))
    
    figure(7),hold on,grid on,plot(t,fff,'b.-','MarkerSize',8);
    title('Grafikas su triuksmu. 0:T-dt')
    legend(sprintf('n=%d tasku, m=%d harmoniku',n,m))
    
ac0=dot(fff,fC(0,T,t))/n;
for i=1:m-1
    ac(i)=dot(fff,fC(i,T,t))*2/n;
    as(i)=dot(fff,fS(i,T,t))*2/n;
end

figure(2),hold on
bar(0:m-1,[ac0,sqrt(ac.^2+as.^2)],0.01)
xx=axis; 
plot([xx(1),xx(2)],slenkstis*[1 1],'b-','LineWidth',3); % braizo slenkscio linija
title('Slenkscio linija')
legend(sprintf('n=%d tasku, m=%d harmoniku, slenkstis=%g ',n,m,slenkstis))


fffz=ac0*fC(0,T,ttt)
frequencies=[1:m-1];
for i=frequencies
    if sqrt(ac(i)^2+as(i)^2) > slenkstis
        fffz=fffz+ac(i)*fC(i,T,ttt)+as(i)*fS(i,T,ttt);    
    end
end

figure(3),hold on,grid on, plot(ttt,fffz,'g-','LineWidth',3);
plot(t,fff,'r-');
plot(ttt,fff2,'b-','LineWidth',2);
title('Aproksimuota funkcija, kuriu amplitudes mazesnes uz nustatyta slenkscio reiksme')
legend(sprintf('n=%d tasku, m=%d harmoniku, slenkstis=%g ',n,m,slenkstis))
%--------------------------------------------------------------------------
Y = fft(fnk(T,t))
Pyy = sqrt(Y.* conj(Y));
filt = 20;  %daznis filtravimui
ind=Pyy<filt;
Y(ind)=0;
yt=ifft(Y);
%--------------------------------------------------------------------------
for i=1:filt
    ac_daz(i)=dot(fff,fC(i,T,t))*2/n;
    as_daz(i)=dot(fff,fS(i,T,t))*2/n;
end
for i=1:m-1-filt-1
    ac_daz1(i)=dot(fff,fC(i+1+filt,T,t))*2/n;
    as_daz1(i)=dot(fff,fS(i+1+filt,T,t))*2/n;
end

figure(5),title('daznio slenkstis'),hold on
    bar(0:filt,[ac0,sqrt(ac_daz.^2+as_daz.^2)],'FaceColor', 'r','EdgeColor','r', 'BarWidth', 0.001)
    bar(filt+1:m-1,[ac0,sqrt(ac_daz1.^2+as_daz1.^2)],'FaceColor', 'b','EdgeColor','b', 'BarWidth', 0.001)
legend('Nefiltruojami dazniai', 'Filtruojami dazniai');
%-----------------------------------------------------------------
fffz1=ac0*fC(0,T,ttt)
frequencies=[1:filt];
for i=frequencies
        fffz1=fffz1+ac(i)*fC(i,T,ttt)+as(i)*fS(i,T,ttt);    
end

figure(6),title('Funkcija, aproksimuota naudojant daznio slenksti'),hold on,grid on, plot(ttt,fffz1,'b','LineWidth',2);plot(t,fff,'g-','LineWidth',1);plot(ttt,fff2,'r-')
legend(sprintf('n=%d tasku, m=%d harmoniku, filtras=%g ',n,m,filt))

return
end

function c=fC(i,T,t), 
    if i==0,
        c=1*cos(0*t); 
    else, 
        c=cos(2*pi*i/T*t); 
    end, 
    return, 
end
function s=fS(i,T,t),
    s=sin(2*pi*i/T*t); 
    return, 
end
function rez=fnk(T,t), %su triuksmais 
    rez=sin(2*pi*t/T) + 0.9*sin(2*pi*2*t/T) + 0.8*sin(2*pi*4*t/T) + 0.1*sin(2*pi*110*t/T + pi/4) + 0.2*cos(2*pi*30*t/T); 
return, 
end
function rez=fnk2(T,t), %be triuksmu
    rez=sin(2*pi*t/T) + 0.9*sin(2*pi*2*t/T) + 0.8*sin(2*pi*4*t/T); 
    return, 
end 
