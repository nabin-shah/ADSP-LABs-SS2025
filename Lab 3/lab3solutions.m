fs=44100; %Sampling rate 44.1 kHz
Ts=1/fs; %sampling period
t=0:Ts:2; %Time vector for 2 seconds 
f0=400; %Frequency of the pure tone. Fundamental frequency
x= cos(2*pi*f0*t);
%sound(x, fs); %play the sound

%Plot the signal(the first 3 periods of the signal are plotted to)
n=1:round(3*fs/f0); %indices for 3 periods
figure(1);
plot(t(n),x(n));
grid on;
xlabel('Time [s]')
ylabel('cos(2\pi f_0 t)')

%Line Spectrum
figure(2);
K= 20; %Number of harmonics to consider 
k=0:K-1; % Harmonics indices (0 to 19)
A =zeros(1,K); % Initialize amplitudes
A(2)= 1; % A(1) is DC A(0), A(2) is A1 (f0)
stem(k*f0,A,'marker','none');




