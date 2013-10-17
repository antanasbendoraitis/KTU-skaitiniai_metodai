function stygu_metodas_var2
clc, close all
syms f x
 
f='x.^4 - 25 * x.^3 + 633/4 * x.^2 - 117 * x -405/4';
 
%Grubus:
R=159.2500
%Tikslesnis:
Rteig=118
Rneig=-4.1721
x=[-R:R/500:R];
figure(1);
grid on;hold on;
plot(x,eval(f),'g-')
run('Pvz_SMA_1_2_Daugianario_saknu_reziu_iverciai');
Stygu_skaiciavimas(-1, 0);
 
fprintf(1, '\nPatikrinimas:');
spr=roots([1 -25 633/4 -117 -405/4])
 
% grafikas ir saknys
plot(spr,zeros(size(spr)),'kp')
legend('f(x)','grubus saknu intervalo ivertis','tikslesnis saknu intervalo ivertis','saknys', 'stygos', 'stygos saknis');
title([char(f),'=0'])
 
figure(2);grid on;hold on;
x=[-20:1:20];
plot(x,eval(f),'g-');
plot(spr,zeros(size(spr)),'kp');
legend('kreive f(x)', 'saknys');
title([char(f),'=0']);
 
end
 
function Stygu_skaiciavimas(l, r)
    syms f x;
    f=x.^4 - 25 * x.^3 + 633/4 * x.^2 - 117 * x -405/4;
    eps=1e-9;
    xn=l; xn1=r; prec=1;
    iter=0;
    while prec > eps
        iter=iter+1;
        x=xn;fxn=eval(f);x=xn1;fxn1=eval(f);
        k=abs(fxn/fxn1);xmid=(xn+k*xn1)/(1+k);
        x=xmid;fxmid=eval(f);
    
        % jeigu pradzioje tikriname kairi taska
        x=xn;fxn=eval(f);
        if sign(fxmid) == sign(fxn), xn=xmid;
        else, xn1=xmid;
        end
        ff = inline('x.^4 - 25 * x.^3 + 633/4 * x.^2 - 117 * x -405/4');
        plot([xn, xn1], [ff(xn), ff(xn1)], 'r-');
        plot (xmid, ff(xmid), 'rp');
        prec=abs(fxmid);
        fprintf(1,'iteracija %d  x= %g  prec= %g \n',iter,xmid,prec);
    end
    return;
end
