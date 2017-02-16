function ASK(tp, f)

%tp es el tren de pulsos binarios
%frecuencia de dicho tren de pulsos
%Ejemplo: ASK([1 0 0 1 0 1 1 0 1],2);

if nargin >2
    error('Demasiados argumentos de entrada')
    
else if nargin == 1
        f = 1;
    end
end

if f<1;
    error('La frecuencia debe ser mayor que 1');
end

t = 0:2*pi/99:2*pi
cp = [];
sp = [];
mod = [];
mod1 = [];
bit = [];

for n = 1:length(tp);
    if tp(n) == 0;
        die = ones(1,100); 
        se = zeros(1,100);
 
    else tp(n)==1;
        die = 2*ones(1,100);
        se = ones(1,100);
    end
    c = sin(f*t);
    cp = [cp die];
    mod = [mod c];
    bit = [bit se];
end

ask = cp.*mod;
 
subplot(2,1,1);plot(bit,'LineWidth',1.5);grid on;
title('Señal Binaria');
axis([0 100*length(tp) -2.5 2.5]);
 
subplot(2,1,2);plot(ask,'LineWidth',1.5);grid on;
title('Modulación ASK');
axis([0 100*length(tp) -2.5 2.5]);


    