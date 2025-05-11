%Test whichever option fits

R= 1e3; C= 0.001e-6; 
R2= 1e3; C2= 0.047e-6; 
R3= 2.2e3; C3= 0.001e-6; 
R4= 2.2e3; C4= 0.047e-6; 

%Interested output at Capacitor V_R

%-------------------------------------------------------


% 1 Define Transfer Function  % R1= 1e3; C1= 0.001e-6; 
num=[R*C,0];
den=[R*C,1];

sys=tf(num,den);
figure;
bode(sys);
title(['For R=1 kΩ and  C= 0.001 µF']);
grid minor;

%-----------------------------------------------------------


% 2 Define Transfer Function  % R2= 1e3; C2= 0.047e-6; 
num2=[R2*C2,0];
den2=[R2*C2,1];

sys2=tf(num2,den2);
figure;
bode(sys2);
title(['For R=1 kΩ and  C= 0.047 µF']);
grid minor;
%---------------------------------------------------------



% 3 Define Transfer Function  % R2= 1e3; C2= 0.047e-6; 
num3=[R3*C3,0];
den3=[R3*C3,1];

sys3=tf(num3,den3);
figure;
bode(sys3);
title(['For R=2.2 kΩ and  C= 0.001 µF']);
grid minor;
%-------------------------------------------------------



% 4 Define Transfer Function  % R2= 1e3; C2= 0.047e-6; 
num4=[R4*C4,0];
den4=[R4*C4,1];

sys4=tf(num4,den4);
figure;
bode(sys4);
title(['For R=1 kΩ and  C= 0.047 µF']);
grid minor;

