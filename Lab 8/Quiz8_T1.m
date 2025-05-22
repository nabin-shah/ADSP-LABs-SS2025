num= [-4.7e-6,1];
den= [4.7e-6,1];

sys=tf(num,den);
bode(sys);
grid minor;
