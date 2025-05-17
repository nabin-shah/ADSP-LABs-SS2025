R_a=1e3; C_a=0.01e-6;
R_b=10e3; C_b=0.001e-6;



% 1. Implement a single RC stage (compare two frequency response)
num=[1];
den1=[R_a*C_a,1];
den2=[R_b*C_b,1];

sys1=tf(num,den1);
sys2=tf(num,den2);

figure;
bode(sys1,sys2);
grid minor;
legend('a-sys1','b-sys2');




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


% 4. in a 2-stage RC ladder if R_1=R_2 and C_1=C_2 
% R1=1e3; C1=0.01e-6;  % R_a=1e3; C_a=0.01e-6;
% R2=10e3; C2=0.001e-6;  % R_b=10e3; C_b=0.001e-6;

num=[1];
den5=[R_a*R_b*C_a*C_b, (R_a*C_a+R_a*C_b+R_b*C_b), 1];

den6=[R_b*R_a*C_b*C_a, (R_b*C_b+R_b*C_a+R_a*C_a), 1];



sys5=tf(num,den5);
sys6=tf(num,den6);
figure;
bode(sys5,sys6);
legend('diff-sys5','diff-sys6' );
grid minor;



 
