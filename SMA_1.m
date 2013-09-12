%oras.if.ktu.lt/moduliai/P170B115
function SMA_1
    clc
    close all
    clear all
    
    option = 6
    switch option
        case 1
            x=[1, 2, 3];
            y=[4, 5, 6];
        case 2
            f='x.*sin(x)';
            x=-10:0.1:10;
            plot(x, f, 'g-');
        case 3
            x = -10:0.1:10;
            f = func(x);
            plot(x,f,'r-');
        case 4
            x = -10:0.1:10;
            f=inline('x.*sin(x)'); %
            plot(x,f(x), 'b--');
        case 5
            syms x f df;
            f=x*sin(x);
            df=diff(f);
            xx = -10:0.1:10;
            plot(xx, subs(f,x,xx));
        case 6
            syms x f;
            f=x*sin(x);
            x = -10:0.1:10;
            plot(x, eval(f));
    end
end

function f=func(x)
    f=x.*sin(x)
return
end
           
            