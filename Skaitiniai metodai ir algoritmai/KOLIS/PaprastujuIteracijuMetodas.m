%
% Vienos lygties sprendimas: paprastuju iteraciju metodas
% 
function PaprastujuIteracijuMetodas
clc,close all
 
%------------------------   PRADINIAI DUOMENYS  ----------------------------
 
 
range=[-1,38];
x0 = 10;
nitmax= 1000;
alpha=100 % parenkame daugiklio reiksme
eps = 1e-9;
 
% braizomas funkcijos grafikas
npoints=1000; x=range(1): (range(2)-range(1))/(npoints-1) :range(2);  fff=f(x);
figure(1); grid on; hold on;
plot(x,fff,'r-');
plot(range,range,'b-');
 
%------------------------   SPRENDIMAS  -----------------------------------
 
xn=x0;prec=1e20; nit=0; % pradinis artinys, pradine tikslumo reiksme ir iteracijos numeris
while prec > eps  % iteracijos
    nit=nit+1;
    if nit > nitmax, fprintf('Virsytas leistinas iteraciju skaicius. Tikslumas nepasiektas');return;end
 
    
            fn=f(xn)/alpha+xn;
            plot([xn,xn,fn],[xn,fn,fn],'g-');
            plot(xn,fn,'mp');
            xn=fn;
    
     
        pause
        
    prec=abs(f(xn));
    nit
    prec
    xn
end
plot(xn,fn,'k*');plot(xn,fn,'ko');
f='x.^3 - 38*x.^2 + 342*x'
fzero(f, x0)
end
 
 
function fff=f(x)
    fff=x.^3 - 38*x.^2 + 342*x;
return
end
