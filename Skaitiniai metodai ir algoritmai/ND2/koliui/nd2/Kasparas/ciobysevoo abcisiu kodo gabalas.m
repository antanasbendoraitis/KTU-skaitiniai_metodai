% Tolygiai paskirtytu interpoliavimo tasku abcises ir ordinates
fprintf('Interpoliavimo mazgai:');
X = [xmin:(xmax-xmin)/(N-1):xmax] 
Y = funkcija(X)
 
fprintf('Ciobysevo (optimalus) interpoliavimo mazgai:');
k=[0:N-1];
XC=(xmax+xmin)/2+(xmax-xmin)/2*cos((2*k+1)*pi/(2*N)) % "Ciobysevo abscises"
YC=funkcija(XC)   %  ordinates "Ciobysevo abscisiu" taskuos
