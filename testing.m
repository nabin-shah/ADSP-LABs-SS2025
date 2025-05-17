% 2. in a 2-stage RC ladder if R_1=R_2 and C_1=C_2 
R1=1e3; C1=0.01e-6;  % R_a=1e3; C_a=0.01e-6;
R2=10e3; C2=0.001e-6;  % R_b=10e3; C_b=0.001e-6;

num=[1];
den3=[R1*R1*C1*C1, 3*R1*C1, 1];
den4=[R2*R2*C2*C2, 3*R2*C2, 1];

sys3=tf(num,den3);
sys4=tf(num,den4);
figure;
bode(sys3,sys4);
legend('R_1 = R_2 =R_a, C_1 =C_2=C_a sys','R_1 = R_2 =R_b, C_1 =C_2=C_b sys' );
grid minor;