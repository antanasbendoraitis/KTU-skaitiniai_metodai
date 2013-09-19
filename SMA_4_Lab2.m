% Paprastuju iteraciju metodas
clear all
close all
clc

f=inline('x.*sin(x)');
figure(1); hold on; grid on;
x=0:0.1:10;
plot(x, f(x), 'b-');

x0=8;
prec=1e-5
alpha=1;
ff=inline('x+x.*sin(x)/alpha', 'x', 'alpha');
figure(2); hold on; grid on;
plot(x, ff(x, alpha));
plot(x, x);
plot(x0, 0, 'gp');
plot([x0, x0, ff(x0, alpha)], [0, ff(x0, alpha), ff(x0, alpha)], 'g-');

x=x0;
while 1
    prec1=abs(f(x));
    fprintf(1, '\n tikslumas = %g', prec1);
    if prec1 < prec; break; end
    x = x+f(x)/alpha;
   plot(x, 0, 'gp');
plot([x, x, ff(x, alpha)], [0, ff(x, alpha), ff(x, alpha)], 'g-');
pause
end

fprintf(1, '\n saknis = %g', x);