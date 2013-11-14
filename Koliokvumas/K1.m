function K1
clc, close all
grid on; hold on; % axis equal;
 
syms f x 
 
% Funkcija
f = 'x.^3 - 1800 * x.^2 + 120', 'x';
% Pradinis artinys
x0=0.0001;
 
range=[-2,1]
% Iteraciju maximumas
nitmax=100; 
% ALPHA
alpha=3; 
% Reikalaujamas tikslumas
eps=1e-4;  
 
x=[-6:0.01:1800];
 
figure(1);
plot(x0, 0, 'cp');
plot(x,eval(f),'b-');
plot(range,range,'r-');
 
 
x=x0;prec=1e20; nit=0; 
while prec > eps  
    nit=nit+1;
    if nit > nitmax, fprintf('Virsytas leistinas iteraciju skaicius. Tikslumas nepasiektas');return;end
 
    fn=eval(f)/alpha+x;
    plot([x,x,fn],[x,fn,fn],'g-');
    plot(x,fn,'mp');
    x=fn;
    
    pause
        
    prec=abs(eval(f));
    fprintf(1,'iteracija %d  x= %g  prec= %g \n',nit,x,prec);
end
plot(x,fn,'k*');plot(x,fn,'ko');
 x
fprintf(1,'\n tikslumas pasiektas, saknis xmid=%g\n\n',x);
end



