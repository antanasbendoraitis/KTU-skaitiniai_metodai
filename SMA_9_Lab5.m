%bus egzamine
%paprastuju iteraciju algoritmas
A = [1 -1  0  0; %duotoji sistema
    -1  2 -1  0; 
     0 -1  2 -1;
     0  0 -1  2]
 b=[20; 0; 0; 0]
 x=A\b
 
 diag(diag(A))
 Atld=inv((diag(diag(A))))*A %sistema parengta PI(GZ) metodui
 btld=inv((diag(diag(A))))*b
 
 alpha=[1; 1; 1; 1];
 Atld=Atld-diag(alpha)
 x=zeros(size(b))
 itmax= 10000; eps=1e-12;
 for i = 1:itmax
    x1=(btld-Atld*x) ./alpha 
    tikslumas=norm(x1-x)/(norm(x)+norm(x1))
    fprintf(1, '\niteracija nr. %d, tikslumas = %g ', i, tikslumas);
    if tikslumas < eps, break, end
    x=x1;
 end

 x1