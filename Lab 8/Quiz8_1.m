R1=3.95e3;
R2=102e3;
C1=1e-9;
C2=100e-12;

K=1.414;
num= K;
den=[R1*R2*C1*C2,((1-K)*R1*C1 + R1*C2+R2*C2), 1];

sys=tf(num,den);
bode(sys);
grid minor;

