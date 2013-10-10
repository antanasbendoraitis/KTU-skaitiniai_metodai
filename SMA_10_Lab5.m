%bus egzamine
%Gauso-Zeidelio algoritmas
A = [1 -1  0  0; %duotoji sistema
    -1  2 -1 0.3; 
     0.2 -1  2 -1;
     0  0 -1  2]
 b=[20; 0; 0; 0]
 n = length(b);
 x=A\b
 
 diag(diag(A))
 Atld=inv((diag(diag(A))))*A %sistema parengta PI(GZ) metodui
 btld=inv((diag(diag(A))))*b
 
 alpha=[1; 10; 1; 1];
 Atld=Atld-diag(alpha)
 x=zeros(size(b)); xold=zeros(size(b))
 itmax= 10000; eps=1e-12;
 for i = 1:itmax
    for j=1:n
        x(j)=(btld(j)-Atld(j, :)*x)/alpha(j);
    end
    tikslumas=norm(xold-x)/(norm(x)+norm(xold))
    fprintf(1, '\niteracija nr. %d, tikslumas = %g ', i, tikslumas);
    if tikslumas < eps, break, end
    xold=x;
 end

 x1