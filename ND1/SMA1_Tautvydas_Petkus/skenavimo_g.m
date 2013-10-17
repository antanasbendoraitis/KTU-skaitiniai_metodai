clc;close all;clear all;
x = -3:.001:3;
f='exp(-x.^2).*sin(x.^2).*(x+2)';
 
plot(x,eval(f),'g-');
grid on; hold on;
n=2000;
prad = -3;
pab = 3;
i=1;
 while(prad <= 3)   
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
