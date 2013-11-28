M = imread('picture.jph');
image(M)
figure(1); hold on;
X=[]; Y=[];
X=1:size(M, 2);
for j=1:size(M, 2)
    for i=1:size(M, 1)
        if sum(M(i, j, :)) < 700
            Y(j)=i;
            break
        else
            Y(j)=i;
        end
    end
    k=k+1;
    Y(k)=0;
end
size(x)
size(Y)
plot(X, Y, '.');
fid=fopen('SX.txt', 'w');
fprintf(fid, '%g\n', X);
fclose(fid);
fid=fopen('SX.txt', 'r');
SX = fscanf(fid, '%g');
fclose(fid);