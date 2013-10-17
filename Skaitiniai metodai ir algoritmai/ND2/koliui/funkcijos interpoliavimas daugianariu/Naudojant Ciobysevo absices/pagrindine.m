function pagrindine
    clc,close all
    xmin=-3.5; xmax=4.5;    % duotas funkcijos apibrezimo intervalas 
    N = 15;                    % interpoliavimo tasku skaicius
    
    naudoti='ciobysevo'
    %naudoti='tolygiai'
    
    if strcmp(naudoti,'tolygiai') == 1
        X=[xmin:(xmax-xmin)/(N-1):xmax]  % tolygiai paskirstytu interpoliavimo tasku abscises
        Y=funkcija(X)          %  tolygiai paskirstytu interpoliavimo tasku ordinates
        leg={'duotoji funkcija',...
            'tolygiai paskirstyti mazgai',...
            'tolygiai paskirstytas interpoliavimas',...
            'liekamasis narys',...
            };    
    else
        leg={'duotoji funkcija',...
            'Ciobysevo abscises',...
            'interpoliavimas per Ciobysevo mazgus',...
            'liekamasis narys',...
            };    
        k=[0:N-1]
        X=(xmax+xmin)/2+(xmax-xmin)/2*cos((2*k+1)*pi/(2*N)) % "Ciobysevo abscises"    
        Y=funkcija(X)   %  ordinates "Ciobysevo abscisiu" taskuose
    end
 
    x=min(X):(max(X)-min(X))/1000:max(X);   %x reiksmes vaizdavimui
    
    figure(1), hold on, grid on,box on,axis equal%, set(gcf,'Color','w'); 
    plot(x,funkcija(x),'b-')   % vaizduojama duotoji funkcija (t.y. pagal kuria interpoliuojama) 
    plot(X,Y,'ro') % vaizduojami tolygiai isdestyti interpoliavimo taskai 
    
    F=niuton(X,Y,x);
 
    plot(x,F,'r-')    % vaizduojama funkcija, interpoliuojanti tolygiai paskirstytuose mazguose 
    plot(x,funkcija(x)-F,'r--'),      % vaizduojama netiktis duotos funkcijos atzvilgiu 
    legend(leg{1:4});
    return
end
 
function fv=niuton(x,y,t) 
    % NIUTON apskai?iuoja interpoliacinio polinomo, 
    % nusakyto interpoliavimo taðkais (x(i),y(i)),i=1,2,...,n+1), 
    % reikðmes fv, kai argumento reikðmes apibr?þia masyvo t elementai. 
    % Polinomo reikðm?s skai?iuojamos pagal Niutono iterpoliacin?form?. 
    % ??jimo parametrai 
    % (x,y) - interpoliavimo taðkai, 
    % t - argumento reikðmi?masyvas. 
    % Ið?jimo parametrai 
    %fv - interpoliacinio polinomo reikðm?s. 
    n=numel(x)-1;%interpoliavimo tasku kiekis 
    m=numel(t); %argumentu kiekis
    
    [k,l]=size(t);
    if k ==1 
        t=t'; 
    end
    
    [k,l]=size(x);
    
    if k ~=1 
        x=x'; y=y'; 
    end
    
    d=y;
    
    for k=1:n 
        h=x(k+1:end)-x(1:end-k);
        tt=(d(k+1:end)-d(k:end-1))./h; 
        d(k+1:end)=tt
    end
    
    xx=repmat(x,m,1);
    dd=repmat(d,m,1);
    tt=repmat(t,1,n);
    
    p=tt-xx(:,1:end-1); 
    r=ones(m,1);
    s=[r cumprod(p,2)];
    
    fv=sum((dd.*s)');
end
 
function fnk=funkcija(x)
    % apskaiciuoja interpoliuojamos funkcijos reiksmes taskuose x
    fnk=cos(2.*x).*exp(-(x/2).^2);
    return
end
