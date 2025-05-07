% %For cutoff frequency 159 Hz.
% R=10e3;  %10kΩ
% C=10e-9; %10nF

%For cutoff frequency 1.59 kHz.
R=1e3;  %10kΩ
C=0.1e-6; %10nF

%For low pass filter
num =[1];
den=[R*C, 1];
sys_lpf= tf(num,den);

%For high pass filter
num2= [R*C,0];
den2= [R*C,1];
sys2_hpf=tf(num2,den2);

%Plot Bode
figure;  
bode(sys_lpf);
hold on; 
bode(sys2_hpf);
grid minor;
legend;

figure;
step(sys_lpf);
hold on;
step(sys2_hpf);
legend;
grid on;
grid minor;
