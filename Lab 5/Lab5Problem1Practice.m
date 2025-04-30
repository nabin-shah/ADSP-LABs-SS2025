R= 100;
L= 11e-3;
C=10e-9;

%Define transfer function 
%Numerator coefficients 
num = [R/L, 0];
den = [1, R/L, 1/(L*C)];

%Transfer function model 
sys= tf(num,den);

%plot frequency response( magnitude and phase)
bode(sys);
grid on;

% This will return magnitude(mag), phase(pha), and frequencies(w) of the system's frequency 
%response.
[mag, pha, w]= bode(sys);
% x=readtable('rlcss_scope.csv');

% figure(2);

% subplot(2,1,1), semilogx(w, 20*log10(mag)), grid on;
% xlabel('Frequency [rad/s]'), ylabel('Magnitude Response [dB]');
% hold on;
% plot(2*pi*x(:,1), 20*log10(x(:,2))) 
% legend({'model', 'data'})

% subplot(2,1,2), semilogx(w, pha), grid on;
% xlabel('Frequency [rad/s]'), ylabel('Phase Response [deg]');
% hold on;
% plot(2*pi*x(:,1), x(:,3))

figure;

f0 = 1/(2*pi*sqrt(L*C));  % resonant frequency
t = [0:0.01/f0:10/f0];    % time array
x = sin(2*pi*f0*t);       % sinusoid input
lsim(sys, x, t);         % plot system response for input x