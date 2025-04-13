fs=44100; % Sampling rate
t=0:1/fs:2; %Time vector for 2 seconds 
f0=200; %Fundamental frequency 
N_harmonic=10;
%initialze compound signal
compound_signal= zeros(size(t));

%Generate and add harmonics 
for k=1:10
    harmonic = sin(2*pi*k*f0*t); %k-th harmonic
    compound_signal=compound_signal+harmonic;
end
%Play the sound
% sound(compound_signal,fs);

n=1: round(3*fs/f0); %Numbaer of samples in 3 periods
figure(1);
plot(t(n), compound_signal(n));
xlabel('Time [s]');
ylabel('Amplitude');
title('Three periods of Compund Signal');
grid on;

%Plot Line Spectrum
k=1:N_harmonic; %Harmonic indices
f=k*f0; % Frequencies of harmonics
A=ones(1,N_harmonic); %Amplitude of each harmonic=1

figure(2);
stem(f,A,'marker','none');
xlabel('Frequency [Hz]');
ylabel('Amplitude A_k');
title('Line Spectrum of Compund Signal');











