R = 100; L = 1e-3; C1 = 1e-6; C2=1e-6; % Example values  

num = [L*C1*C2,0,1];  
den = [L*C1*C2, R*C1*C2,(C1+C2)];  
sys = tf(num, den);  
bode(sys);   
grid minor;