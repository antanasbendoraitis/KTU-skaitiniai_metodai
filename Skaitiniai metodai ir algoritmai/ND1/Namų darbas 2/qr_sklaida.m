% Darba atliko: Kæstutis Èesnavièius IFK-0
% === APLINKOS TVARKYMAS ===
clc;        % Isvalo komandine eilute 
close all;  % Uzdaro visus langus
clear all;  % Isvalo visus kintamuosius
disp('QR Sklaida')
% === KINTAMIEJI ===
A=[  3   9   1   5; % Koficiantu matrica
    -1  -3  10  12;
     3  10  -4   1;
    -1 -16   4   0;]
Ap=A;
b= [ 79;100;47;-53;] % Laisvuju nariu matrica
n=size(A,1),  nb=size(b,2)
disp(' tiesioginis zingsnis(atspindziai)')
Q=eye(n);
for i=1:n-1
    z=A(i:n,i);
    zp=zeros(size(z));
    zp(1)=sign(z(1))*norm(z);
    omega=(z-zp); 
    omega=omega/norm(omega);
    Qi=eye(n-i+1)-2*omega*omega'
    A(i:n,:)=Qi*A(i:n,:)
    Q=Q*[eye(i-1),zeros(i-1,n-i+1);zeros(n-i+1,i-1),Qi];
end
disp('Q*A patikrinimas:')
xz = Q*A

disp('qr skaidos patikrinimas:')
[Qp,Rp]=qr(Ap)

disp('Qp*Rp patikrinimas:')
xx = Qp*Rp
disp('Atvirkstinis zingsnis:')
b1=Q'*b
x=zeros(n,nb);
x(n,:)=b1(n,:)/A(n,n);
for i=n-1:-1:1
    x(i,:)=(b1(i,:)-A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end
x
