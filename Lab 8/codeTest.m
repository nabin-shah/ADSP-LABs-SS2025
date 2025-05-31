
clc 
clear all 
close all 

% Low pass 
R1 = 2.12e3; R2 = 10.8e3; C1 = 1e-9; C2=1e-9;

% R3 = 20e3; R4 = 8.28e3;


num= [45454545.454545];
den=[1, 5545.4545454545, 45454545.454545];
% K = (R4 + R3)/R3;
% num = [ 0,0, K ];
% den = [ R1*R2*C1*C2, ((1-K)*(R1*C1) + (R1*C2) + (R2*C2)), 1 ];
sys = tf(num, den);

% bode(sys);


% ## Plot Frequency Response 
[mag, pha, w] = bode(sys);
mag=squeeze(mag);
pha=squeeze(pha);

x = readmatrix('test_data4.csv');
% x = readmatrix('test_data.csv','Delimiter',',','NumHeaderLines',1,'OutputType','double');% 3 columns: freq, magnitude, phase

subplot(2,1,1), semilogx(w, 20*log10(mag)), grid;
xlabel('Frequency [rad/s]'), ylabel('Magnitude Response [dB]');
hold on;

plot(2*pi*x(:,1), 20*log10(x(:,2)))

legend('model', 'data')


subplot(2,1,2), semilogx(w, pha), grid;
xlabel('Frequency [rad/s]'), ylabel('Phase Response [deg]');
hold on
plot(2*pi*x(:,1), x(:,3))
legend('model', 'data')



