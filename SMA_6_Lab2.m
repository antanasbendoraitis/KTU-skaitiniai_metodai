%kirstiniu (kvazi-Niutono) metodas
clear all
close all
clc

f = inline('x.*sin(x)');

figure(1); hold on; grid on;
xx=-2:0.1:10;
plot(xx , f(xx), 'b-');

xx1=5; xx0 = 5.1;

prec=1e-5
alpha=1;

plot(xx0, 0, 'gp');
plot(xx1, 0, 'gp');
plot([xx1, xx1], [0, f(xx1)], 'g-');

while 1
    prec1=abs(f(xx1));
    fprintf(1, '\n tikslumas = %g', prec1);
    if prec1 < prec; break; end
    xx2 = xx1 - alpha*(xx1-xx0)/(f(xx1)-f(xx0))*f(xx1);
    
   plot(xx2, 0, 'ro');
plot([xx0, xx1, xx2, xx2], [f(xx0), f(xx1), 0, f(xx2)], 'g-');
    xx0=xx1; xx1=xx2;
pause
end

fprintf(1, '\n saknis = %g', xx1);