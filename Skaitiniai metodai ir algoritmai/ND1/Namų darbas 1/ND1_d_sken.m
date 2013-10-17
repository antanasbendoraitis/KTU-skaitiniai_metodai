%grafiko braizymas
clc;close all;clear all; %clear screen , uzdaryti viska, is matlabo atminties isvalyti kintamuosius
x = -499:.001:23.3;
f='x.^4+95.*x.^3-498.*x.^2+208.*x+800';

plot(x,eval(f),'Color','r');
grid on; hold on;
set(gca,'FontName','Times New Roman Baltic');
Title ('Funkcijos grafikas ir ðaknys');
n=2000;
prad = -499;
pab = 23.3;
i=1;
 while(prad <= 23.3)   
    x = prad;
    fx=eval(f);
    x = prad + 0.01;
    fxpb = eval(f);
    if sign(fx)~= sign(fxpb);
    saknys(i) = fzero(f,prad) % jeigu intervale kelios skanys tai nesuras reikia po viena kad intervale butu
    i=i+1;
    end
    prad = prad + 0.01; 
 end

plot(saknys,0*saknys,'ko','MarkerFaceColor','r','MarkerSize',8);%pazymi saknis ant grafiko
Legend('Daugianaris','Ðaknys');
xlabel('x');ylabel ('f(x)');
set(get (gca,'YLabel'),'Rotation',0.0);