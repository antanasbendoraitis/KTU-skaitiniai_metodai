%Grafiko braizymas
clc; close all;clear all;
x=2:0.2:8;
f='1./(1+0.5.*(x-5)^2))^(eps(-(x-5)^2))';
n = 1;
x = 2;
arx=1:80;
ary=1:80;
intervalas = 0.2;
prad = x;
while (prad < 8)
        x = prad;
        arx(n) = x;
        ary(n) = eval(f)
        prad = prad + intervalas;
        n = n + 1;
end;

arx
ary