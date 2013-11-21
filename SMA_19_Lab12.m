function main
clc
clear all
close all
SX=0:0.1:12; SY=fff(SX);
figure(1); hold on; plot(SX, SY);
n=6; nnn=2^n;
a=min(SX); b=max(SX); t=a:(b-a)/(nnn-1):b;
ts=interp1(SX,SY,t); SX=[]; SY=[];
SX=t; SY=ts;
plot(SX,SY, 'r.');
m=6; glodinimas=(b-a)*SY*2^(-n/2);
for i=1:m
    glodinimas1=(glodinimas(1:2:end)+glodinimas(2:2:end))/sqrt(2);
    detales{i} = (glodinimas(1:2:end)-glodinimas(2:2:end))/sqrt(2);
    glodinimas=glodinimas1;
    G=[i, glodinimas];
    fprintf('\n detales %d: %g', i, detales{i});
end
h=zeros(1, nnn);
for k=0:2^(n-m) - 1
    h=h+glodinimas(k+1)*Haro_mastelis(SX, n-m, k, a, b);
end
    figure(2); hold on; subplot(m+1, 1, 1); plot(SX, h);
for i=0:m-1
    h1=zeros(1, nnn);
    for k=0:2^(n-m) - 1
        h1=h1+detales{m-i}(k+1)*Haro_bangele(SX,n-m+i, k, a, b); 
    end
    figure(3); hold on; subplot(m, 1, i+1); plot(SX, h1);
    h=h+h1;
    figure(2); hold on; subplot(m, 1, i+1); plot(SX, h);
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

function f=fff(x)
f=zeros(size(x));
for i=1:length(x)
    if x(i)>pi && x(i) < 2*pi
        f(i)=sin(x(i));
    elseif x(i) >= 2*pi && x(i) < 3*pi
        f(i)=2*abs(sin(x(i)));
    end
end
return
end