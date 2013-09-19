%liestiniu (niutono) metodas
clear all
close all
clc

syms x f df
f= x * sin(x);
df = diff(f);
figure(1); hold on; grid on;
xx=-2:0.1:10;
plot(xx , subs(f, x, xx), 'b-');

x0=2;
prec=1e-5
alpha=1;

plot(x0, 0, 'gp');
plot([x0, x0], [0, subs(f, x, x0)], 'g-');

xx=x0;
while 1
    prec1=abs(eval(subs(f, x, xx)));
    fprintf(1, '\n tikslumas = %g', prec1);
    if prec1 < prec; break; end
    x1 = xx-alpha*subs(f, x, xx) / subs(df, x, xx);
    
   plot(x1, 0, 'gp');
plot([xx, x1, x1], [subs(f, x, xx), 0, subs(f, x, x1)], 'g-');
    xx=x1;
pause
end

fprintf(1, '\n saknis = %g', xx);