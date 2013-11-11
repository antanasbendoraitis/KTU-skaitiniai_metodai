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
        aa = A1(i,n+1:end);
        bb = A1(i,i+1:n);
        cc = x(i+1:n,:);
        dd = A1(i,i);
        tikr = ismember([1] ,ismember([Inf, -Inf],cc));
        if dd == 0;
            fprintf('SISTEMA TURI BE GALO DAUG SPRENDINIU\n')
            dd = 1;
        end
        x(i,:)=(aa-bb*cc)/dd;
    end
        disp('Sprendinys x='),x
        disp('Patikrinimas:'),liekana=A*x-b
        disp('Paklaida:'),disp(norm(liekana)/norm(x))
end