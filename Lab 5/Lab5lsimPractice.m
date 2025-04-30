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
% bode(sys);
% grid on;

f0 = 1/(2*pi*sqrt(L*C));  % resonant frequency
t = [0:0.01/f0:10/f0];    % time array
x = sin(2*pi*(f0)*t);       % sinusoid input
lsim(sys, x, t);         % plot system response for input x
grid on;

%lsim - Calculates and plots the system's response to the input signal x.
%sys is the transfer function 