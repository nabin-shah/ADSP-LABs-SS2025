R = 100; L = 1e-3; C = 1e-6;  % Example values  

num = [1/(R*C), 0];  
den = [1, 1/(R*C), 1/(L*C)];  
sys = tf(num, den);  
bode(sys);  
title('RLC Band-Pass Filter (Figure 5)');  
grid minor;