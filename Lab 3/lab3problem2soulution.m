fs=44100; % Sampling rate 
t= 0:1/fs:2; %Time vector for 2 seconds 
f0=200; %Fundamental frequency 
N_harmonics =10;

%Initialize the compund signal 
compound_signal= zeros(size(t));

%Generate and add odd harmonics 
for k=1:2:2*N_harmonics-1  %k=1,3,5,7,....,19
    harmonic= (1/(pi*k)) *sin(2*pi*k*f0*t);
    compound_signal=compound_signal + harmonic;
end


% Play the sound
sound(compound_signal,fs);

% Plot three periods 
n=1:round(3*fs/f0);
figure(1);
plot(t(n), compound_signal(n));
xlabel('Time [s]');
ylabel('Amplitude');
title('Sinusoids');
grid on;

%Plot the Line Spectrum
k=1:2:2*N_harmonics-1; %Odd harmonics (1,3,5,...,19)
A=1./(pi*k); % Amplitudes
figure(2);
stem(k*f0,A,'marker','none');
xlabel('Frequency [Hz]');
ylabel('Amplitude A_k');
title('Line Spectrum');
grid on;