syms x f f1
f = sin(x);
f1 = taylor(f, 'ExpansionPoint', 0, 'Order', 31);
x = -10:0.2:10;
figure(1); hold on; grid on;
plot(x, eval(f), 'g-');
plot(x, eval(f1), 'b-');
koef=sym2poly(f1);
saknys=roots(koef);
for i = 1:length(saknys)
    if isreal(saknys(i)); plot(saknys(i), 0, 'ro'); end
end