function L2_3_Vienanariai
    clc, close all
    fprintf(1, 'Interpoliavimo mazgai:');
    X = [-2 -1.5 -1 -0.5  0 0.5  1    1.5   2    2.5 3]
    Y = [0 0.04 0.31 0.29 0 0.48 0.93 0.29 -0.06 0   0]
    % interpoliavimo laipsnis
    n = size(X, 2);
    nn=1000; a=min(X); b=max(X);
    % sudarome baziniu f-ciju matrica B
    for i = 1:n
         B(:,i)=X.^(i-1)
    end
 
    % randame f-cijos koeficientus
    A= B\Y';
    disp('Vienanariu interpoliacines f-jos koeficientai:');
    disp(A');
    
    figure(1), grid on, hold on;
     x=[a:(b-a)/(nn-1):b];
    plot(X, Y, 'ro', x, foo(x,A));
    title 'Interpoliavimas vienanari? baz?je'
  end
 
function y = foo(x, A)
    y = 0;
    for i = 1:size(A, 1) 
        y = y + A(i).* x.^(i-1);
    end
    return
end