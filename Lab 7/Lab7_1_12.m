R=100;
C=10e-9;

% single RC stage 
num= [1];
den= [R*C, 1];
sys1= tf(num,den);

%two-stage RC ladder with buffer
sys2= sys1 * sys1; % series composition

bode(sys1, sys2);
grid minor;