clc; close all;clear all;

x = 1:0.3:5;
f='(1./(1+(x-3)^2)).*eps^(-(x-3)^2)';
n = 1;
x = 1;
arx=1:16;
ary=1:16;
intervalas = 0.3;
prad = x;
while (prad < 5)
        x = prad
        arx(n) = x;
        ary(n) = eval(f);
        prad = prad + intervalas;
        n = n + 1;
end;

format long e;
arx
ary