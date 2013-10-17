
function Periodinis_pirmos_eiles_defekto
clc, close all, clear all
 
xmin=-5; xmax=5; n=9;
t=[xmin:(xmax-xmin)/(n-1):xmax]
X=funkcijaX(t), Y=funkcijaY(t)
 
figure(1), hold on, grid on
plot(X,Y,'o');
 
figure(2), hold on, grid on
plot(t,X,'go');
plot(t,Y,'bo');
tt=[xmin:(xmax-xmin)/((n-1)*20):xmax];
plot(tt,funkcijaX(tt),'g-');
plot(tt,funkcijaY(tt),'b-');
legend('','','X(t)','Y(t)');
figure(1)
DDFX=splaino_koeficientai(t,X);
DDFY=splaino_koeficientai(t,Y);
for iii=1:n-1
    SplainoX=splainas(t(iii:iii+1),X(iii:iii+1),DDFX(iii:iii+1));
    SplainoY=splainas(t(iii:iii+1),Y(iii:iii+1),DDFY(iii:iii+1));
    plot(SplainoX,SplainoY)
end
return, end
 
function S=splainas(X,Y,DDF)
nnn=100;
d=X(2)-X(1);
xxx=X(1):d/(nnn-1):X(2);
sss=xxx-X(1);
S=DDF(1)*(sss.^2/2-sss.^3/(6*d)) + DDF(2)*sss.^3/(6*d)+...
    ((Y(2)-Y(1))/d-DDF(1)*d/3-DDF(2)*d/6)*sss+...
    Y(1);
return, end
 
function DDF=splaino_koeficientai(X,Y)
n=length(X);
A=zeros(n);b=zeros(n,1);
d=X(2:n)-X(1:(n-1));
 for i=1:n-2
     A(i,i:i+2)=[d(i)/6, (d(i)+d(i+1))/3,d(i+1)/6];
     b(i)=(Y(i+2)-Y(i+1))/d(i+1)-(Y(i+1)-Y(i))/d(i);
 end
 
A(n-1,[1,2,n-1,n])=[d(1)/3, d(1)/6, d(n-1)/6,d(n-1)/3];
A(n,[1,n])=[1,-1];
b(n-1)=(Y(2)-Y(1))/d(1)-(Y(n)-Y(n-1))/d(n-1);
DDF=A\b;      
return, end
 
function funkX=funkcijaX(x)
funkX=(x/5).*sin(x);
return, end
 
function funkY=funkcijaY(x)
funkY=(x/5).*cos(x);
return, end


