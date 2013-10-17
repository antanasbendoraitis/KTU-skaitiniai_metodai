% 
% Vienos lygties sprendimas: pusiaukirtos ir stygu metodai
% 
function Pvz_SMA_1_3_Viena_lygtis_bisection_chords
clc,close all

%------------------------   PRADINIAI DUOMENYS  ---------------------------

% f='2*x.*cos(2*x)-(x+1).^2'  % funkcijos simboline israiska
f='exp(-(x./2).^2).*sin(2*x)';
% f='x^2'       % tokiai funkcijai siais metodais saknu nerasime

% range=[-6,6] % parenkame saknu atskyrimo intervala 
% range=[-8,-6];
% range=[-5,-4];
% range=[-4,-2];
% range=[-2,-0.5];
range=[-0.5,1];
% range=[1,2];
% range=[2,4];
% range=[4,8];
eps=1e-9;  % parenkame tikslumo reiksme 
nitmax=100;% parenkame didziausia leistina iteraciju skaiciu
method='bisection';  % parenkame sprendimo metoda

% braizomas funkcijos grafikas
npoints=1000; x=range(1): (range(2)-range(1))/(npoints-1) :range(2);  
figure(1); grid on; hold on;
str=[f,'=0;   Method of ',method]; title(str);
plot(x,eval(f),'r-');
plot(range,[0 0],'b-');

%------------------------   SPRENDIMAS  -----------------------------------

xn=range(1);xn1=range(2);prec=1;
nit=0;
while prec > eps
    nit=nit+1;
    if nit > nitmax, fprintf('Virsytas leistinas iteraciju skaicius');break;end
    plot(xn,0,'mp');h = findobj(gca,'Type','line');h1=h(1); % paskutinio grafinio objekto valdiklis irasomas handle masyvo priekyje
    plot(xn1,0,'cp');h = findobj(gca,'Type','line');h2=h(1);
    
    xmid=(xn+xn1)/2;plot(xmid,0,'gs');h = findobj(gca,'Type','line');h3=h(1);
    x=xmid;fxmid=eval(f);
    
    % jeigu pradzioje tikriname kairi taska
    x=xn;fxn=eval(f);
    if sign(fxmid) == sign(fxn), xn=xmid;
    else, xn1=xmid;
    end
    
%     x=xn1;fxn1=eval(f);
%     if sign(fxmid) == sign(fxn1), xn1=xmid;
%     else, xn=xmid;
%     end
        
    pause(1)
    delete(h1);delete(h2);delete(h3);
    
    prec=abs(fxmid); 
    fprintf(1,'iteracija %d    tikslumas= %g \n',nit,prec);
end
plot(xmid,0,'k*');plot(xmid,0,'ko');
fprintf(1,'\n tikslumas pasiektas, saknis xmid=%g\n\n',xmid);
end