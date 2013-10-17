function main
    clc,close all,clear all
    n=1000;     % n - tasku skaicius
    m=200;      % m - harmoniku skaicius
    M=2*m-1;    % M -koeficientu skaicius
    
    if M > n 
        'per didelis harmoniku skaicius!';
    end
    
    T=4;            % T - duotas periodas
    slenkstis=0.2 ; % harmoniku amplitudziu slenkstis triuksmu filtravimui
    dt=T/n;
    N=1000;         % N - vaizdavimo tasku skaicius
    dttt=T/N;

    t=[0:dt:T-dt];
    ttt=[-T:dttt:2*T];

    fff=fnk(T,t); % apskaiciuojame ir pavaizduojame duota tasku seka 
    figure(1),hold on,grid on,plot(t,fff,'b.-','MarkerSize',8);
    legend(sprintf('n=%d tasku, m=%d harmoniku',n,m))

    ac0=dot(fff,fC(0,T,t))/n;
    for i=1:m-1
        ac(i)=dot(fff,fC(i,T,t))*2/n;
        as(i)=dot(fff,fS(i,T,t))*2/n;
    end
    figure(2),hold on
    bar(0:m-1,[ac0,sqrt(ac.^2+as.^2)],0.01)
    xx=axis; plot([xx(1),xx(2)],slenkstis*[1 1],'m--','LineWidth',3); % braizo slenkscio linija
    legend(sprintf('n=%d tasku, m=%d harmoniku, slenkstis=%g ',n,m,slenkstis))

    fffz=ac0*fC(0,T,ttt);
    frequencies=[1:m-1];
    %frequencies=[1:4];
    for i=frequencies
        if sqrt(ac(i)^2+as(i)^2) > slenkstis
            fffz=fffz+ac(i)*fC(i,T,ttt)+as(i)*fS(i,T,ttt);    
        end
    end

    figure(3),hold on,grid on, plot(ttt,fffz,'r');plot(t,fff,'b-','LineWidth',2);
    legend(sprintf('n=%d tasku, m=%d harmoniku, slenkstis=%g ',n,m,slenkstis))

    return
end
 
function c=fC(i,T,t)
    if i==0
        c=1*cos(0*t); 
    else
        c=cos(2*pi*i/T*t);
    end
    return
end

function s=fS(i,T,t)
    s=sin(2*pi*i/T*t); 
    return
end

function rez=fnk(T,t)
    % su triuksmais
    rez=sin(2*pi*t/T) + 0.9*sin(2*pi*2*t/T) + 0.8*sin(2*pi*4*t/T) + 0.1*sin(2*pi*110*t/T +pi/4)+ 0.2 * cos(2*pi*30*t/T);
    % be triuksmu
    %rez=sin(2*pi*t/T) + 0.9*sin(2*pi*2*t/T) + 0.8*sin(2*pi*4*t/T);
    return
end
