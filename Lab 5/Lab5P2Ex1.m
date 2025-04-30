% Define component values
R = 100;
L = 1e-3;
C = 10e-9;

% Define state-space matrices
A = [0, 0, -1/L; 0, -R/L, 1/L; 1/C, -1/C, 0];
B = [1/L; 0; 0];
C_out = [0, R, 0];
D = [0];

% Create state-space system
sys_ss = ss(A, B, C_out, D);

% Plot frequency response (Bode plot)
bode(sys_ss);
grid on;
title('Frequency Response of Circuit (Fig. 4)');