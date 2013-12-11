function Vienanariai
clc,clear all
close all
%============================================================
X = [ -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 ];
Y = [ 0 0.04 0.31 0.29 0 0.48 0.93 0.29 -0.06 0 0];
fprintf(1, '\nTolygiai paskirstyti taskai (x asis): \n');
fprintf(1, ' %g ', X);
fprintf(1, '\nTolygiai paskirstyti taskai (y asis): \n');
fprintf(1, ' %g ', Y);
n=11;
%===============================================================
x=min(X):(max(X)-min(X))/1000:max(X); %x asies reiksmes brezimui
figure(1), hold on, grid on
%============================================================
n=length(X);set(gca,'Fontname','Times New Roman Baltic');
fprintf('\n');
fprintf('***Interpoliavimas per tolygiai pasiskirsciusius taðkus vienanariø bazëje***\n\n')
fprintf('Interpoliavimo mazgai:\n')
fprintf('\nX= ')
for i=1:n
fprintf('\t%4.2f',X(i))
end
fprintf('\nY= ')
for i=1:n
fprintf('\t%4.2f',Y(i))
end
fprintf('\n')

xx=zeros(n,n);
for j=1:n
    xx(:,j)=X.^(j-1);
end
xx
A=xx\Y';
fprintf('\nVienanariø interpoliacinës iðraiðkos koeficientai:\n\n');
for i=1:n
fprintf('\t%9.4f',A(i))
end
fprintf('\n')
%=================================================================

title('Interpoliuota pagal tolygiai pasiskirsciusius taskus')
x=min(X):(max(X)-min(X))/1000:max(X);
f=zeros(size(x));
for i=1:n
    f=f+A(i)*x.^(i-1);
end
plot(X,Y,'o','MarkerEdgeColor','r','MarkerFaceColor','b','MarkerSize',10);
hold on; grid on; plot(x,f,'r','LineWidth',2);
set(gca,'Fontname','Times New Roman Baltic');xlabel('X');ylabel('Y');
set(get(gca,'YLabel'),'Rotation',0.0);
title('Interpoliavimas vienanariø bazeje','FontWeight','Bold','Fontsize',14);
legend('Interpoliavimo mazgai','Interpoliacine funkcija','Location','NorthWest')
%====================================================
plot(x, f, 'r-', 'LineWidth', 2) %Braizoma funkcija interpoliuota pagal tolygiai paskirstytus taskus
legend({'Tolygiai pasiskirstæ taðkai','Interpoliacinë funkcija'})
end