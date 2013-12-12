%Tautvydas Petkus IFF-1
%splainas laisvais galais
function splainai_laisvais_galais
clc, close all, clear all
Mini=-pi;Maxi=pi;  % funkcijos intervalai
    n=7;               % taskai
    t=[Mini:(Maxi-Mini)/(n-1):Maxi]
    X=funkcijaX(t)
    Y=funkcijaY(t)
figure(1), hold on, grid on 
plot(X,Y,'ro');
    
figure(2), hold on, grid on
plot(t,X,'ro');     
plot(t,Y,'go');
    var=[Mini:(Maxi-Mini)/((n-1)*20):Maxi];
    plot(var,funkcijaX(var),'r-');
    plot(var,funkcijaY(var),'g-');
    
    DDFX=spline_kof(t,X);
    DDFY=spline_kof(t,Y);
    figure(1)
    for j=1:n-1
        SX=spline(t(j:j+1),X(j:j+1),DDFX(j:j+1));
        SY=spline(t(j:j+1),Y(j:j+1),DDFY(j:j+1));
        plot(SX,SY)
    end
return, end

function S=spline(X,Y,DDF)
    nnn=100;
    d=X(2)-X(1);
    xxx=X(1):d/(nnn-1):X(2);
    sss=xxx-X(1);
    S=DDF(1)*(sss.^2/2-sss.^3/(6*d)) + DDF(2)*sss.^3/(6*d)+...
        ((Y(2)-Y(1))/d-DDF(1)*d/3-DDF(2)*d/6)*sss+Y(1);
return, end

function DDF=spline_kof(X,Y)
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
    fnkX=sin(x + pi/3);
return, end

function fnkY=funkcijaY(x)
    fnkY=0.4 * cos(x);
return, end