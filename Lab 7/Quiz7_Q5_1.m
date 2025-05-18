% 2. in a 2-stage RC ladder if R_1=R_2 and C_1=C_2 
L=1e-3;
C=0.01e-6;
% R=470;
R=100;


num=[R];
den=[L*L*C*C*R, C*L*L, 3*L*C*R, 2*L, R];

sys=tf(num,den);
figure;
bode(sys);
grid minor;
title('R = 100 Ω');
%----------------------------------------------------------



% when  R= 470 Ω
R1=470;
num1=[R1];
den1=[L*L*C*C*R1, C*L*L, 3*L*C*R1, 2*L, R1];

sys1=tf(num1,den1);
figure;
bode(sys1);
grid minor;
title('R = 470 Ω');
%----------------------------------------------------------



% when R= ∞

num2=[1];
den2=[L*L*C*C, 0, 3*L*C, 0, 1];
sys2=tf(num2,den2);

figure;
bode(sys2);
grid minor;
title('when R = ∞')