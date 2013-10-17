function Viena_lygtis_Simple_iteration_Newton_Secant
clc, close all
%------------------------   PRADINIAI DUOMENYS  ---------------------------
syms f x 
f=x.^4+95.*x.^3-498.*x.^2+208.*x+800;
% f=(0.5*x.^2-1)*1 % parenkame funkcija
% f=atan(x)

x0=1; % parenkame pradini artini
nitmax=100; % parenkame didziausia leistina iteraciju skaiciu
if x0 ~= 0, range=3*[-abs(x0),abs(x0)]; % parenkame intervala vaizdavimui
else, range=[-110,6];
end

eps=1e-9;  % Parenkame tiksluma
beta=0.7; 
f
df=diff(f,x) % Taikant Niutono metoda reiks ne tik funkcijos, 
             % taciau ir jos isvestines israiskos

% braizomas funkcijos grafikas:
 npoints=100;            % Intervalu skaicius
    xrange=range(1): (range(2)-range(1))/(npoints-1) :range(2); % Nustato intervala pagal nurodyta intervala  
    figure(1);              % Sukuria figuros objekta
    grid on;
    hold on;
%     axis equal;
    x=xrange; % simbolinis x keiciamas reiksmemis is parinkto funkcijos vaizdavimo intervalo
    plot(x,eval(f),'r-');
    plot(range,[0 0],'b-');
    plot(x0,0,'mp');
    h = findobj(gca,'Type','line');
    h1=h(1);

% ------------------------   SPRENDIMAS  -----------------------------------
xn=x0;prec=1;nit=0;
while prec > eps    % iteracijos 
    nit=nit+1;
    if nit > nitmax, fprintf('Virsytas leistinas iteraciju skaicius');break;end
            
            x=xn;fxn=eval(f);dfxn=eval(df);
            xn1=xn-beta*fxn/dfxn;   % daugikliu alpha galima apriboti x prieaugi, tikintis
                                     % geresnio konvergavimo   
            plot([xn,xn,xn1],[0,fxn,0],'g-');
            delete(h1);plot(xn1,0,'mp');h = findobj(gca,'Type','line');h1=h(1);
            xn=xn1;            
     
%         pause(1)
        input('Press Enter'), figure(1); % skaiciavimas stabdomas iki bus paspaustas Enter klavisas
        
    x=xn;fxn=eval(f);prec=abs(fxn);
    fprintf(1,'iteracija %d  x= %g  prec= %g \n',nit,xn,prec);
end
plot(xn,fxn,'k*');plot(xn,fxn,'ko');
xn
nit
end


