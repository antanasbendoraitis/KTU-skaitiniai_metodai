function GZ
% Gauso-Zeidelio algoritmas su alpha ciklu
 
clc, clear all
A=[
 2 1 0 4 3;
 8 1 -2 5 2;
 1 14 1 0 1;
 -2 1 16 2 0;
 5 0 2 6 4
 
] % coefficient matrix
b=[4; -20; 15.5; 19; 3] % right-hand side vector
 
n=size(A,1)
Aprad=A;
 
alpha=[10000000; 100000; 10; 100; 1];  % laisvai parinkti metodo parametrai
 
% Matrica kurios istrizainej 1-alfa.
Atld=diag(1./diag(A))*A-diag(alpha)
% B matrica kuri padalinta is A isstrizainiu (B_k / A_kk)
btld=diag(1./diag(A))*b
nitmax=1000000;
% Tikslumas
eps=1e-5;
x=zeros(n,1);x1=zeros(n,1);
fprintf(1,'\n sprendimas iteracijomis:'); 
for it=1:nitmax
    for i=1:n
        x1(i)=(btld(i)-Atld(i,1:i-1)*x1(1:i-1)-Atld(i,i:n)*x(i:n))/alpha(i);
    end
  prec(it)=norm(x1-x)/(norm(x)+norm(x1));
  fprintf(1,'iteracija Nr. %d,  tikslumas  %g\n',it,prec(it))
  if prec(it) < eps, break, end
  x=x1;
end
disp('Atsakymas:')
x
disp('Patikrinimas')
Aprad*x-b
 
semilogy([1:length(prec)],prec,'r.');grid on,hold on
linsolve(A, b)