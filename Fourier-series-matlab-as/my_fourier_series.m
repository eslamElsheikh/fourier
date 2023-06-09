clc;
close all;

% Time period enteries
t1 = input("Enter from time: ");
t2 = input("Enter to time: ");

% Number of coefficients is set to 32(-16:1:16) you can change it if more are


% Time period
T = t2 - t1;

% Range of the function variable
k = (t1):0.001:(t2);

% Function
f = (3.*cos(k));

% ===========================================================================================================
% FOURIER SERIES COEFFICIENTS

Cn = zeros(1, 31); % Number of fourier series coefficients
C = 0; 
j = 1;
  for n = -16:1:16 % Number of coefficients
    c = zeros(1, length(k));
    for u = 1:1:length(k)
        c(u) = f(u)* exp( (-1i*2*pi*n*k(u)) / T );
    end
    C = (1/T) * trapz(k, c); % Using trapizoidal form of integration 
    Cn(j) = C;
    j = j+1;
  end
disp(Cn);
 

% ==========================================================================================================
% Using the fourier series coefficients fourier series can be written

S = zeros(1, length(k));
for h = 1:1:length(k)
    n = 1;
    Su = 0;
    for b = -16:1:16 % Number of coefficients
        Su = Su + (Cn(n)* exp( (1i*2*pi*b*k(h)) / T ));
        n = n+1;
    end
    S(h) = Su;
end


% ----------------------------------------------------------------------------------------------------------

% plotting function 
subplot(2,2,1);
plot(k*(180/pi),f);
title('func f');
grid on;

% plotting coefficients 
% real
v = -16:1:16; % Number of fourier series coefficients
subplot(2,2,2);
plot(v, real(Cn));
grid on;
xlim([-16, 16]);
title('real coefficients ');

%imaginary
v = -16:1:16; % Number of fourier series coefficients
subplot(2,2,3);
plot(v, imag(Cn));
grid on;
title('imaginary coefficients ');

% plotting reconstruction 
subplot(2,2,4);
plot(k*(180/pi),S);
title('recon func ');
grid on;
