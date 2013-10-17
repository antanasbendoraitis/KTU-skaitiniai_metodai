%Gausas
function Gausas
   clc, close all, clear all
        A=[3 7 1 3;
        1 -6 6 8;
        4 4 -7 1;
        -1 3 8 2]
    b=[31;-5;33;-2]
    n=size(A,1),  nb=size(b,2)
    A1=[A,b]
    %Tiesioginis
    for i=1:n-1
        for j=i+1:n,
            A1(j,i+1:n+nb)=A1(j,i+1:n+nb)-A1(i,i+1:n+nb)*A1(j,i)/A1(i,i);
            A1(j,i)=0;   
        end
        A1
    end

    % Atvirkstinis
    x=zeros(n,nb);
    for i=n:-1:1
        x(i,:)=(A1(i,n+1:end)-A1(i,i+1:n)*x(i+1:n,:))/A1(i,i);
    end
    disp('sprendinys x='),x
    disp('Patikrinimas:'),liekana=A*x-b
    disp('Paklaida:'),disp(norm(liekana)/norm(x))
end