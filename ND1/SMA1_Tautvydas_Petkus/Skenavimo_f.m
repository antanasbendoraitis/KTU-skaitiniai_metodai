clc;close all;clear all;
x = -10:.001:20;
f='x.^4 - 25 * x.^3 + 633/4 * x.^2 - 117 * x -405/4';
 
plot(x,eval(f),'g-');
grid on; hold on;
n=2000;
prad = -10;
pab = 20;
i=1;
 while(prad <= 20)   
    x = prad;
    fx=eval(f);
    x = prad + 0.01;
    fxpb = eval(f);
    if sign(fx)~= sign(fxpb);
    saknys(i) = fzero(f,prad) % kelios saknys
    i=i+1;
    end
    prad = prad + 0.01; 
 end
 
plot(saknys,0*saknys,'kp');%saknys
legend('kreive f(x)', 'saknys');
title([char(f),'=0']);
