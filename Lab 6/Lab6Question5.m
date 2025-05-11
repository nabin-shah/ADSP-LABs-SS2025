%Test whichever option fits

% R1= 1e3; C1= 0.001e-6; 
R= 1e3; C= 0.047e-6; 
% R3= 2.2e3; C3= 0.001e-6; 
% R4= 2.2e3; C4= 0.047e-6; 
L=1e-3;


den=[L*C,R*C,1];
%Interested output at Capacitor V_R

%-------------------------------------------------------


% 1 Define Transfer Function  ;
num1=[R*C,1];

sys1=tf(num1,den);
figure;
bode(sys1);
title(['Output at V_R']);
grid minor;
%-------------------------------------------------------


%Interested output at V_L
% 2 Define Transfer Function  ;
num3=[L*C,0,0];

sys3=tf(num3,den);
figure;
bode(sys3);
title(['Output at V_L']);
grid minor;
%-------------------------------------------------------


%Interested output at V_R + V_C
% 2 Define Transfer Function  ;
num4=[R*C,1];

sys4=tf(num4,den);
figure;
bode(sys4);
title(['Output at V_L']);
grid minor;
