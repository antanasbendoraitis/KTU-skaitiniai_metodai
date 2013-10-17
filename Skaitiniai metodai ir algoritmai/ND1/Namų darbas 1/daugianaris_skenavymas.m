%grafiko braizymas
clc;close all;clear all; %clear screen , uzdaryti viska, is matlabo atminties isvalyti kintamuosius
x = -4:.001:118; % x kinta nuo -3 iki 3 kitimo zingsnis .001
%f='exp(-x.^2).*sin(x.^2).*(x+2)'; %taskai dedami pries daugyba dalyba pakelima laipsniu reiskia kad veiksmai bus atliekami panariui kai norime nubraizyti grafiak dedame taskus
% f='x.^4-25.*x.^3+633/4.*x.^2-117.*x-405/4';
f='x.^4+95.*x.^3-498.*x.^2+208.*x+800';

plot(x,eval(f),'Color','r');
grid on; hold on;
set(gca,'FontName','Times New Roman Baltic');
Title ('Funkcijos grafikas ir ðaknys');
n=2000;
prad = -4;
pab = 118;
i=1;
 while(prad <= 118)   
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