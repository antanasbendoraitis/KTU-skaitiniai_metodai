%LU
%2 3 1 1 = 12
%0 2 1 3 = 5
%7 -4 1 1 = 6
%1 -12 1 1 -36
function LU_skaida
    clc, close all, clear all
    
    A=[2 3 1 1;
       0 2 1 3;
       7 -4 1 1;
       1 -12 1 1]
    b=[12; 5; 6; -36]
 
    n=size(A,1)
    P=[1:n]
    Aold=A
    bold=b
 
    for i=1:n-1
        [a,iii]=max(abs(A(i:n,i)));
        A([i,i+iii-1],:)=A([i+iii-1,i],:);
        P([i,i+iii-1])=P([i+iii-1,i]);
        for j=i+1:n
            r=A(j,i)/A(i,i);
            A(j,i+1:n)=A(j,i+1:n)-A(i,i+1:n)*r;
            A(j,i)=r;   
        end
    end
    b=b(P)
    %Ly=b, y->b
    for i=2:n, b(i,:)=b(i,:)-A(i,1:i-1)*b(1:i-1); end
    %Ux=b, x->b
    for i=n:-1:1, b(i)=(b(i)-A(i,i+1:n)*b(i+1:n))/A(i,i); end
 
    fprintf(1, 'Sprendinys:');
    x=b
    fprintf(1, 'AX-B:');
    Aold*x-bold
    fprintf(1, 'Patikrinimas:');
    linsolve(Aold, bold)
    % L ir U matricos
    L=[];
    U=[];
    for i=1:n
        U=[U; zeros(1, i-1), A(i,i:n)];
    end
    for i=1:n
        L=[L; A(i,1:i-1) 1 zeros(1, n-i)];
    end
    fprintf(1, 'Gauta skaida');
    U
    L
    fprintf(1, 'Atstatyta pradin? matrica');
    A=L*U;
    A=A(P,:)
    fprintf(1, 'Skaidos patikrinimas:');
    [L,U,P]=lu(Aold);
    U
    L
    L*U

end
