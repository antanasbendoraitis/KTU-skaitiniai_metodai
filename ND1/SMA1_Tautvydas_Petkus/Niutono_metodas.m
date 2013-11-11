function Niutono_metodas
 
clc, close all
syms f x 
f='exp(-x.^2).*sin(x.^2).*(x+2)';
x0=-1; 
nitmax=100; 
range=[-3,3];

eps=1e-9;  
beta=0.5 ; 
df=diff(eval(f),x);
x=-3:0.01:3;

npoints=2000; xrange=range(1): (range(2)-range(1))/(npoints-1) :range(2);  
figure(1); grid on; hold on; axis equal; title('Niutonas');
x=xrange; 
 
 plot(x,eval(f),'g-');h = findobj(gca,'Type','line');h1=h(1);
 
xn=x0;prec=1;nit=0;
while prec > eps    % iteracijos 
    nit=nit+1;
    if nit > nitmax, fprintf('Iteraciju skaicius virsytas');break;end
        x=xn;fxn=eval(f);dfxn=eval(df);
        xn1=xn-beta*fxn/dfxn;    
        plot([xn,xn,xn1],[0,fxn,0],'r-');
        plot(xn1,0,'mp');h = findobj(gca,'Type','line');h1=h(1);
        xn=xn1;  
        x=xn;fxn=eval(f);prec=abs(fxn);
        fprintf(1,'iteracija %d  x= %g  prec= %g \n',nit,xn,prec);
end
plot(xn,0,'k*');plot(xn,0,'ko');
legend('f(x)','liestines statmenys','taskai');
