%QR metodas
clear all
clc
A = [1 1 1 1; 1 -1 -1 1; 2 1 -1 2; 3 1 2 1];
b = [2; 0; 9; 7]
A=[1 -3 2 -1; 2 5 -1 9; 4 -1 3 7; 0 0 0 0];
b=[

n=size(A, 1); A1=[A, b];
A1
%tiesioginis etapas
for i=1:n-1
    z=A1(i:n, i);
    z1=zeros(size(z));
    omega=(z-z1);
    omega=omega/norm(omega);
    Q=eye(n-i+1)-2*omega*omega';
    A1(i:n, :)= Q * A1(i:n, :);
    A1
end
%atvirkstinis etapas
x=zeros(n, 1);
x(n)=A1(n, n+1)/A1(n, n);
for i=n-1:-1:1
    x(i)=(A1(i, n+1) - A1(i, i+1:n)*x(i+1:n))/A1(i,i);
end
x