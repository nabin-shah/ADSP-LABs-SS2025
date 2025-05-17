R=100;
C=0.01e-6;

% one stage 
num=[1];
den=[R*C,1];
sys=tf(num,den);

%for 2 stages
sys2=sys*sys;
figure;
bode(sys2);
grid minor;
legend('2-stages')



% for 3 stages 
sys3=sys*sys*sys;
figure;
bode(sys3);
grid minor;
legend('3-stages')


% for 4 stages
sys4=sys*sys*sys*sys;
figure;
bode(sys4);
grid minor;
legend('4-stages')