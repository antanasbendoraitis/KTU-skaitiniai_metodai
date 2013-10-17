function LU_Sklaida
clc, close all
A=[2 3 0 1 0;
   5 2 -1 2 0;
   -1 0 6 0 2;
   0 0 2 2 -5;
   2 1 0 -1 2];
b=[5; 7; 3; 17; 2];
n=size(A,1);
bold=b; Aold=A;
 
xlin=linsolve(A,b)
L=diag(ones(n,1));
U=zeros(n,n);
 
[tL,tU]=lu(A)
 
U(1,:)=A(1,:);
for i=1:n-1
    for j=i+1:n
        r=A(j,i)/A(i,i);
        
        U(j,i:n)=A(j,i:n)-A(i,i:n)*r;
        L(j,i)=r;     
        
        A(j,i+1:n)=A(j,i+1:n)-A(i,i+1:n)*r;
        A(j,i)=r;
    end
end 


U
L 
for i=2:n
    b(i,:)=b(i,:)-A(i,1:i-1)*b(1:i-1);
end
 
 
for i=n:-1:1
    b(i)=(b(i)-A(i,i+1:n)*b(i+1:n))/A(i,i);
end
 
b
liekana=Aold*b-bold
end