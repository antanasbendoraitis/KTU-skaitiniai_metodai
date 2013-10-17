
% Gauso algoritmas su vedancio elemento parinkimu
clc
A=[1 2 1 0;
   2 5 0 4;
   14 -8 4 1;
   4 10 0 8]
b=[-9;-9;-2;-18]
% b=[2 1;0  2;9 3;7 3]
n=size(A,1),  nb=size(b,2)
A1=[A,b]

%  Naudojant A ir b atskirai, veiksmus su b atlikti pirma, kol dar nepakites A

% Tiesioginis zingsnis:
for i=1:n-1
    [a,iii]=max(abs(A1(i:n,i))); % parenkamas vedantis elementas:
     if iii > 1, A1([i,i+iii-1],:)=A1([i+iii-1,i],:); end % eilutes sukeiciamos vietomis
    for j=i+1:n,   A1(j,i:n+nb)=A1(j,i:n+nb)-A1(i,i:n+nb)*A1(j,i)/A1(i,i);    end
    A1
end

% Atvirkstinis zingsnis

x=zeros(n,nb);
for i=n:-1:1
    x(i,:)=(A1(i,n+1:end)-A1(i,i+1:n)*x(i+1:n,:))/A1(i,i);
end

disp('sprendinys x='),x
disp('sprendinio patikrinimas:'),liekana=A*x-b
disp('bendra santykine paklaida:'),disp(norm(liekana)/norm(x))