% Parameters
R = 100;       % Ohms
L = 1e-3;      % Henry
C = 0.01e-6;      % Farad

Rs= 10;  %Test for different values.

num = [R*L, 0];
den = [R*L*C* Rs, (R*L+Rs*L), Rs*R];

%Transfer function model;
sys=tf(num,den);

bode(sys);
% grid on;
grid minor;
title(['Frequency Response of RLC Circuit Rs=', num2str(Rs), ' \Omega']); % Add a descriptive title


