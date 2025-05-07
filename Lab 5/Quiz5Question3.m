% Parameters
R = 100;       % Ohms
L = 1e-3;      % Henry
C = 0.01e-6;      % Farad


den = [L*C, R*C, 1]; %same for all 

%------------------------------------------------
%1. Transfer function across V_R
num1 = [R*C, 0];
%1. Transfer function model
sys1 = tf(num1, den);
figure;
bode(sys1);
title('Frequency Response, while output across V_R')
% grid on;
grid minor;
%---------------------------------------------------




%2. Transfer function across V_L
num2 = [L*C, 0, 0];
%2. Transfer function model
sys2 = tf(num2, den);
figure;
bode(sys2);
title('Frequency Response, while output across V_L')
% grid on;
grid minor;
%---------------------------------------------------




%3. Transfer function across V_C
num3 = [1];
%3. Transfer function model
sys3 = tf(num3, den);
figure;
bode(sys3);
title('Frequency Response, while output across V_C')
% grid on;
grid minor;
%---------------------------------------------------




%4. Transfer function across V_L + V_C
num4 = [L*C, 0, 1];
%4. Transfer function model
sys4 = tf(num4, den);
figure;
bode(sys4);
title('Frequency Response, while output across V_L + V_C')
% grid on;
grid minor;
%---------------------------------------------------




%5. Transfer function across V_C + V_R
num5 = [R*C, 1];
%5. Transfer function model
sys5 = tf(num5, den);
figure;
bode(sys5);
title('Frequency Response, while output across V_C + V_R')
% grid on;
grid minor;
%---------------------------------------------------