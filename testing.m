%Test whichever option fits

% R1= 1e3; C1= 0.001e-6; 
R= 1e3; C= 0.047e-6; 
% R3= 2.2e3; C3= 0.001e-6; 
% R4= 2.2e3; C4= 0.047e-6; 
L=1e-3;



%Interested output at Capacitor V_R

%-------------------------------------------------------


% 1 Define Transfer Function  ;
% num1=[L,R];
num1=[L,0,0];
den=[R*L*C,L,R];
% num1=[R*L*C,0,0];
% den=[R*L*C,L,R];

sys1=tf(num1,den);
figure;
bode(sys1);
title(['Output at V__CL']);
grid minor;