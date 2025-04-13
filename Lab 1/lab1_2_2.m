Ts= 0.01;       %sampling period
t=[0:Ts:10];    %sample times 
tau=1.5         %time constant of exponential 
f0=5;           %sinusoidal frequency
x=exp(-t/tau) .* cos(2*pi*f0*t); 
plot(t,x);
%--------------------------------------------
Ts= 0.01; %Sampling period=10ms
t=[0:Ts:2] %time array from 0 to 2 seconds
f0=2; % Frequency =2 Hz

x1=sin(2*pi*f0*t).^2; % Squared sine signal.
plot(t,x1);