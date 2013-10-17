%Grafiko braizymas
clc; close all;clear all;
x=-6:.001:6;
f='exp(-(x./2).^2).*sin(2*x)';
plot(x,eval(f),'color', 'c'); 
grid on; hold on;
set(gca, 'FontName','Times New Roman Baltic');
Title('Funkcijos grafikas ir ðaknys');
n = 0;
x = -6;
intervalas = 0.1;
prad = x;
pab = prad + intervalas;
while (prad < 6)
        x = prad; fxpr = eval(f);
        x = pab; fxpab = eval(f);
        if  (fxpr > 0 & fxpab < 0) | (fxpr < 0 & fxpab > 0)
            prad = prad + intervalas
            pab = prad + intervalas;
        else
            if fzero(f, prad)
                n = n + 1;
                saknis(n) = fzero(f, prad);
            end;
        end;
    prad = prad + intervalas
    pab = prad + intervalas;
end;
plot(saknis,0*saknis,'ko','MarkerFaceColor','r','MarkerSize',8);
Legend('Funkcija','Ðaknys');
% ko: k - juodas, o - apvalus markeris.
xlabel('x'); ylabel('f(x)');
set(get(gca, 'YLabel'),'Rotation',0.0);