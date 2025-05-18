% 4. in a 2-stage RC ladder if R_1=R_2 and C_1=C_2 
% R1=1e3; C1=0.01e-6;  % R_a=1e3; C_a=0.01e-6;
% R2=10e3; C2=0.001e-6;  % R_b=10e3; C_b=0.001e-6;
R_a=1e3; C_a=0.01e-6;
R_b=10e3; C_b=0.001e-6;
num=[1];
den5=[R_a*R_b*C_a*C_b, (R_a*C_a+R_a*C_b+R_b*C_b), 1];

den6=[R_b*R_a*C_b*C_a, (R_b*C_b+R_b*C_a+R_a*C_a), 1];



sys5=tf(num,den5);
sys6=tf(num,den6);
figure;
bode(sys5,sys6);
legend('diff-sys5','diff-sys6' );
grid minor;