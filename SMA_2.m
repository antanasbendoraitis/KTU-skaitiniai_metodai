%atkarpos dalijimas
f = inline('x.*sin(x)');
x = 2:0.2:6;
plot (x, f(x));
figure(1); hold on; grid on;

xn = 2;
xn1 = 6;
h(1) = plot(xn, 0, 'gp'); 
h(2) = plot(xn1, 0, 'gp');
h1=[];

prec = 1e-5;

while 1
   prec1=abs(xn-xn1)/(abs(xn)+abs(xn1));
   fprintf(1, '\netikslumas = %g', prec1);
   if prec1 <prec; break; end
   
   k=abs(f(xn)/f(xn1));
   xmid=(xn+xn1)/2;
   
   if ~isempty(h1), delete(h1); end
   h1=plot(xmid,f(xmid), 'ro');
   pause
   
   if sign(f(xmid))==sign(f(xn))
       xn=xmid;
   else
       xn1=xmid;
   end
   
   %delete(h); 
   h(1)=plot(xn, 0, 'gp'); 
   h(2) = plot(xn1, 0, 'gp');
end