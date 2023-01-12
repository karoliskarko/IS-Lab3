close all 
clear all 
clc

% Pasirinkti DNT struktūrą: 
% vienas įėjimas x
% vienas paslėptasis sluoksnis su 2 neuronais
% vienas isejimas y

% 1. Duomenu paruosimas

x = 0.1:1/22:1;
d = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))/2;

figure(1)
plot(x,d,'rx')

% 2. Spindulio tipo baziniu funkciju parametrai
% grafike is akies nustatome c1, c2, sigma1, sigma2 parametrus

c1 = 0.19;
sigma1 = 0.21;
c2 = 0.91
sigma2 = 0.22;

% parametrai mokymui
w0 = rand(1);
w1 = rand(1); 
w2 = rand(1);

zingsnis = 0.2;

for index = 1:100000
    for n = 1:20
        % 3. SBF atsaku skaiciavimas
        Phi_1 = exp(-(x(n) - c1)^2/(2*sigma1^2));
        Phi_2 = exp(-(x(n) - c2)^2/(2*sigma2^2));

        % 4. tinklo atsako skaiciavimas
        v = Phi_1*w1 + Phi_2*w2 + w0;
        y = v;

        % 5. Lyginame norima atsaka su teisingu atsakymu
        e = d(n) - y; % klaidos skaiciavimas

        % 6. Rysiu svoriu atnaujinimas
        w1 = w1 + zingsnis*e*Phi_1; 
        w2 = w2 + zingsnis*e*Phi_2; 
        w0 = w0 + zingsnis*e;
    end
end

for n = 1:20
    % SBF atsaku skaiciavimas
    Phi_1 = exp(-(x(n) - c1)^2/(2*sigma1^2));
    Phi_2 = exp(-(x(n) - c2)^2/(2*sigma2^2));

    % tinklo atsako skaiciavimas
    v = Phi_1*w1 + Phi_2*w2 + w0;
    y(n) = v;
end

figure(2)
plot(x,d,'rx',x,y,'b-')











