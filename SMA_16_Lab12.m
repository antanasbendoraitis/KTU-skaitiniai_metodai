%aproksimavimas
function main
clc
clear all
xmin=0; xmax=10; ymin=0; ymax=10;
figure(1); hold on; axis([xmin xmax ymin ymax]);
X=[0.9 1.1 1.9 2 2.1 3.05 4.2];
Y=[1 0.9 1.8 2.2 2.3 2.95 4.1];
plot(X, Y, 'o');
m=5;
n=length(X);
G=base(m,X);
C=(G'*G)\(G'*Y');
s=sprintf('%5.2g', C(1));
for i=1:m-1
    s=[s, sprintf('+%5.2gx^d', C(i+1), i)];
end
s=strrep(s, '+ -', '-');
nnn=200;
xxx=xmin:(xmax-xmin)/nnn:xmax;
Gv=base(m, xxx);
fff=Gv*C;
plot(xxx, fff, 'r-');
end

function G=base(m, x)
for i=1:m
    G(:, i)=x.^(i-1);
end
return
end