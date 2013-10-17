%splainas laisvais galais
function splainai
clc, close all, clear all
    
    xmin=-5;xmax=5;  % duotas funkcijos apibrezimo intervalas 
    n=9;               % interpoliavimo tasku skaicius
    t=[xmin:(xmax-xmin)/(n-1):xmax]
    X=funkcijaX(t)
    Y=funkcijaY(t)

    figure(1), hold on, grid on
    plot(X,Y,'o');
    
    figure(2), hold on, grid on
    plot(t,X,'go');
    plot(t,Y,'bo');
    tt=[xmin:(xmax-xmin)/((n-1)*20):xmax];
    plot(tt,funkcijaX(tt),'g-');
    plot(tt,funkcijaY(tt),'b-');
    
    DDFX=splaino_koeficientai(t,X);
    DDFY=splaino_koeficientai(t,Y);
    figure(1)
    for iii=1:n-1
        SX=splainas(t(iii:iii+1),X(iii:iii+1),DDFX(iii:iii+1));
        SY=splainas(t(iii:iii+1),Y(iii:iii+1),DDFY(iii:iii+1));
        plot(SX,SY)
    end
return, end

function S=splainas(X,Y,DDF)
    nnn=100;
    d=X(2)-X(1);
    xxx=X(1):d/(nnn-1):X(2);
    sss=xxx-X(1);
    S=DDF(1)*(sss.^2/2-sss.^3/(6*d)) + DDF(2)*sss.^3/(6*d)+...
        ((Y(2)-Y(1))/d-DDF(1)*d/3-DDF(2)*d/6)*sss+Y(1);
return, end

function DDF=splaino_koeficientai(X,Y)
    n=length(X);
    d=X(2:n)-X(1:n-1);
    A=zeros(n-2,n);
    b=zeros(n-2,1);
    for i=1:n-2
        A(i,i:i+2)=[d(i)/6, (d(i)+d(i+1))/3, d(i+1)/6];
        b(i)=(Y(i+2)-Y(i+1))/d(i+1)-(Y(i+1)-Y(i))/d(i);
    end
    A = A(:,2:end-1)
    b
    DDF = zeros(n,1);
    DDF(2:end-1,1) = A\b
return, end

function fnkX=funkcijaX(x)
    fnkX=(x/5).*sin(x);
return, end

function fnkY=funkcijaY(x)
    fnkY=(x/5).*cos(x);
return, end