function splainai
clc
close all
figure(1); hold on;
syms f x
f=1./(1+5*x.^2);
df=diff(f);
np=7;
xrange=[-pi, pi];
x=xrange(1):(xrange(2)-xrange(1))/(np-1):xrange(2);
Y=eval(subs(f, x, X));
plot(X, Y, 'ro');
DDF=splaino_koeficientai(X, Y, 1);
for ii=1:np-1
    nnn=100;
    [s, sss]=splainas(X(iii:iii+1), Y(iii:iii+1), DDF(iii:iii+1), nnn);
    %plot kazkas
end    
end

function DDF=splaino_koeficientai(X, Y, opt)
n=length(X);
A=zeros(n); b=zeros(n, 1);
d=X(2:n)-X(1:n-1);
for i=1:n-2
    A(i, i+2)=[d(i)/6 (d(i)+d(i+1))/3 d(i+1)/6];
    b(i)=(Y(i+2)-Y(i+1))/d(i+1)-(Y(i+1)-Y(i))/d(i);
end
if opt==0 %laisvi galai
    A(n-1, 1)=1, A(n, n)=1;
else
    A(n-1, [1 2 n-1 n]) = [d(1)/3 d(1)/6 d(n-1)/6 d(n-1)/3];
    A(n, [1, n]) = [1, -1];
    b(n-1) = (Y(2)-Y(1))/d(1) - (Y(n) - Y(n-1))/d(n-1);
end
DDF=A\b;
return
end

function [s, sss]=splainas(X, Y, DDF, nnn)
d=X(2)-X(1);
sss=X(1) : (X(2) - X(1))/ (nnn-1): X(2);
s=DDF(1)/2*(sss-X(1)).^2+(DDF(2)-DDF(1))/(6*d)*(sss-X(1)).^3+(sss-X(1))*((Y(2)-Y(1))/d-DDF(1)*d/3 - DDF(2)*d/6)+Y(1);
return
end