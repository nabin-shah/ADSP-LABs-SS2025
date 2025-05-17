R=100; C=10e-9;

% single RC stage
num= [1];
den =[R*C, 1];
sys1= tf(num,den);

% two-stage RC ladder
A= [-2/(R*C),1/(R*C); 1/(R*C), -1/(R*C) ];
B= [ 1/(R*C); 0];
C=[0, 1];
D=0;

sys2=ss(A,B,C,D);

bode(sys1,sys2); 
grid minor;
