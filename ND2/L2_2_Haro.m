function L2_2_Haro
M = imread('picture.png');
image(M)
figure(1); hold on;
X=[]; Y=[];
X=1:size(M, 2);
%k=0;
for j=1:size(M, 2)
    for i=1:size(M, 1)
        if sum(M(i, j, :)) < 700
            Y(j)=i;
            break
        else
            Y(j)=i;
        end
    end
end
fid=fopen('SX.txt', 'w');
fprintf(fid, '%g\n', X);
fclose(fid);
fid=fopen('SX.txt', 'r');
SX = fscanf(fid, '%g');
fclose(fid);

SY = Y;
n=7; nnn=2^n; a=min(SX); b=max(SX);
t=a:(b-a)/(nnn-1):b; ts=interp1(SX,SY,t);
SX=t; SY=ts;
ts=interp1(SX,SY,t); SX=t;SY=ts;
plot(SX, SY, 'r.'); 

m_all=[5 7]; current_figure=2; 
for m=m_all;
    smooth=(b-a)*SY*2^(-n/2);
    for i=1:m
        smooth1=(smooth(1:2:end)+smooth(2:2:end))/sqrt(2);
        details{i}=(smooth(1:2:end)-smooth(2:2:end))/sqrt(2);
        fprintf(1,'\n |||series %d :  ',i);fprintf('%g ', details{i});
        smooth=smooth1;
    end
    h=zeros(1,nnn);
    for k=0:2^(n-m)-1          
        h=h+smooth(k+1)*Haro_mastelis(SX,n-m,k,a,b);
    end
    for i=0:m-1
        h1=zeros(1,nnn);          
        for k=0:2^(n-m+i)-1             
            h1=h1+details{m-i}(k+1)*Haro_bangele(SX,n-m+i,k,a,b);           
        end  
        h=h+h1;          
        if i+1==m             
            figure(current_figure);             
            current_figure = current_figure + 1;             
            hold on;             
            plot(SX,h);             
            title(sprintf('%d' ,i+1));         
        end
    end
end
end

function h=Haro_bangele(x, j, k, a, b)
eps=1e-9;
xtld=(x-a) ./ (b-a);
xx=2^j*xtld-k;
h=2^(j/2)*(sign(xx-eps)-2*sign(xx-0.5)+sign(xx-1-eps))/(2*(b-a));
return
end

function h=Haro_mastelis(x, j, k, a, b)
eps=1e-9;
xtld=(x-a) ./ (b-a);
xx=2^j*xtld-k;
h=2^(j/2)*(sign(xx-eps)-sign(xx-1-eps))/(2*(b-a));
return
end