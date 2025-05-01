% Parameters
% R = 100;       % Ohms  Put R as infinity
L = 1e-3;      % Henry
C = 0.01e-6;      % Farad

Rs= 68;  %Test for different values.

num = [L, 0];
den = [L*C* Rs, L, Rs];

%Transfer function model;
sys=tf(num,den);

bode(sys);
% grid on;
grid minor;
xlim([1e4, 1e7]); % Set x-axis limits
title(['Frequency Response of RLC Circuit Rs=', num2str(Rs), ' \Omega']); % Add a descriptive title


