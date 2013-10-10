%var3
%x^4 - 25 * x^3 + 633/4 * x^2 - 117 * x -405/4
clear all
close all
clc

syms f(x)
f(x) = x.^4 - 25 * x.^3 + 633/4 * x.^2 - 117 * x -405/4;
%f = sym('x.^4 - 25 * x.^3 + 633/4 * x.^2 - 117 * x -405/4');
%figure(1); hold on; grid on;
%x=-10:0.1:20;
%plot(x, f(x));
ai = sym2poly(f(x));
module_ai = abs(ai);
size = size(module_ai);
module_ai_n = module_ai(2:1:size(2));
max_ai = max(module_ai_n);
grubus_ivertis = 1 + (max_ai / ai(1));
negative_ai = [];
for idx = 1:size(2)
    if ai(idx) < 0;
        negative_ai = [negative_ai ai(idx)];
    end
end
max_negative_ai = max(negative_ai);
max_negative_i = find(ai==max_negative_ai,1);
B = abs(max_negative_ai);
k = size(2) - max_negative_i;
Rteig = 1 + nthroot(B/ai(1), k);