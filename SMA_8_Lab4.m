%Choleckio skaida

A=[4 3 -1 1;
   3 9 -2 2;
   -1 2 11 -1;
   1 -2 -1 5];
b=[12; 10; -28; 16];
n=size(A,1);
L=zeros(size(A));
for i=1:n
    L(i,i)=sqrt(A(i,i)-sum(L(1:i-1,i).^2));
    for j=i+1:n
        L(i,j)=(A(i,j)-L(1:i-1,i)'*L(1:i-1,j))/L(i,i);
    end
end
L