R=100;
C=10e-9;

num =[1];
den=[R*C, 1];
sys= tf(num,den);
bode(sys);
grid on;
grid minor;