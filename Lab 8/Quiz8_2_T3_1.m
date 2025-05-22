num= [-31446.540880503,0];
den= [1,31496.062992126, 24685745687.754];

sys=tf(num,den);
bode(sys);
grid minor;