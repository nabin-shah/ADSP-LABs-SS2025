%For cutoff fc=1.59 kHz
R=10e3; 
C=10e-9;
fc= 1/(2*pi*R*C); %Alteratively can replace with the real value

num= [1];
den=[R*C,1];
sys= tf(num,den);

f0= [fc/100, fc/10, fc, 10*fc, 100*fc] % Frequencies to test
% t=0:1e-5:5e-3;  %Time Vector
t = linspace(0,20/fc,1000); %Time vector(10 periods of fc)

duty_cycle = 50;

for i= 1:length(f0)
    Vin= square(2*pi*f0(i)*t, duty_cycle);
    figure;
    lsim(sys,Vin,t);
    title(['Square Wave: f_{in}=',num2str(f0(i)/1e3), 'kHz (f_c = 1.59 kHz)']);
    grid on;
    legend;
end