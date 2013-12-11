function Niutonas
clc,clear all
close all
%============================================================
X = [ -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3 ];
Y = [ 0 0.04 0.31 0.29 0 0.48 0.93 0.29 -0.06 0 0];
fprintf(1, '\nTolygiai paskirstyti taskai (x asis): \n');
fprintf(1, ' %g ', X);
fprintf(1, '\nTolygiai paskirstyti taskai (y asis): \n');
fprintf(1, ' %g ', Y);
%===============================================================
x=min(X):(max(X)-min(X))/1000:max(X); %x asies reiksmes brezimui
figure(1), hold on, grid on
%============================================================
n=length(X);set(gca,'Fontname','Times New Roman Baltic');
fprintf('\n');
fprintf('***Interpoliavimas Niutono bazëje***\n\n')
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
xx(:,1)=1;
for j=2:n
    for i=j:n
    san=1;
        for k=1:j-1
        san=san*(X(i)-X(k));
        xx(i,j)=san;
        end
    end
end

fprintf('\nBaziniø funkcijø reikðmës interpoliavimo mazguose:\n\n')
for i=1:n
    for j=1:n
    fprintf('\t%9.4f',xx(i,j));
    end
    fprintf('\n')
end
A=inv(xx)*Y';
fprintf('\nNiutono interpoliacinës iðraiðkos koeficientai:\n\n');
for i=1:n
fprintf('\t%9.4f',A(i))
end
fprintf('\n')
%=================================================================

title('Interpoliuota pagal tolygiai pasiskirsciusius taskus')
x=min(X):(max(X)-min(X))/1000:max(X);
f=A(1);
for i=2:n
    sand=1;
    for k=1:i-1
        sand=sand.*(x-X(k));
    end
    f=f+A(i).*sand;
end
plot(X,Y,'o','MarkerEdgeColor','r','MarkerFaceColor','b','MarkerSize',10);
hold on; grid on; plot(x,f,'r','LineWidth',2);
set(gca,'Fontname','Times New Roman Baltic');xlabel('X');ylabel('Y');
set(get(gca,'YLabel'),'Rotation',0.0);
title('Interpoliavimas Niutono bazëje','FontWeight','Bold','Fontsize',14);
legend('Interpoliavimo mazgai','Interpoliacine funkcija','Location','NorthWest')
%====================================================
plot(x, f, 'r-', 'LineWidth', 2) %Braizoma funkcija interpoliuota pagal tolygiai paskirstytus taskus
legend({'Tolygiai pasiskirstæ taðkai','Interpoliacinë funkcija'})
end