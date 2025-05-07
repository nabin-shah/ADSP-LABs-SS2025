R=100;
C=10e-9;

num= [R*C,0];
den= [R*C,1];
sys=tf(num,den);

bode(sys);
grid minor;