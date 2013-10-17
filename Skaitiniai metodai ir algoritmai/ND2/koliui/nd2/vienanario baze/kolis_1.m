%*****************
% programos kodas
%*****************
 
function Vienanariu
clc, clear all, close all
format
fprintf(1, 'Interpoliavimo mazgai:');
X =[3.0000    3.4000    3.8000    4.2000    4.6000    5.0000    5.4000]
Y =[1.8001    1.1646    0.9861    1.0761    1.5234    2.8328    5.3655]
Y1 = Y';
 
n = length(X);
X1 = zeros(n);
 
for i=1:n
	for j=1:n
    	X1(i, j) = X(i).^(j-1);
	end
end
fprintf(1, 'Baziniu funkciju reiksmes interpoliavimo mazguose:');
X1
fprintf(1, 'Vienanariu interpoliacines israiskos koeficientai:');
A = X1\Y1;
A = A'
 
x=X(1):0.01:X(numel(X));
f = fnk(x, A);
figure(1),grid on, hold on, axis equal;
plot(x, f)
plot(X, Y, 'ko', 'MarkerFaceColor','g');
legend('Interpoliacine f-ja','Interpoliavimo taskai');
end
 
function f = fnk(x,A)
f = 0;
m = length(A);
for i=m:-1:1
	f = f + A(i)*x.^(i-1);
end
return
end