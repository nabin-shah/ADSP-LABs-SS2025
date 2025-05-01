% Parameters
R = 100;       % Ohms
L = 1e-3;      % Henry
C = 0.01e-6;      % Farad

% s = Laplace variable
s = tf('s');

% Denominator for all transfer functions
den = R*s*C + s^2*L*C + 1;

% 1. Output across VR
H_R = (R*s*C) / den;

figure;
bode(H_R);
grid on;
title('Frequency Response of H_R(s) = V_R / V_{in}');

% 2. Output across VL
H_L = (s^2*L*C) / den;

figure;
bode(H_L);
grid on;
title('Frequency Response of H_L(s) = V_L / V_{in}');

% 3. Output across VC
H_C = 1 / den;

figure;
bode(H_C);
grid on;
title('Frequency Response of H_C(s) = V_C / V_{in}');

% 4. Output across VL + VC
H_LC = (s^2*L*C + 1) / den;

figure;
bode(H_LC);
grid on;
title('Frequency Response of H_{L+C}(s) = (V_L + V_C) / V_{in}');

% 5. Output across VC + VR
H_CR = (R*s*C + 1) / den;

figure;
bode(H_CR);
grid on;
title('Frequency Response of H_{C+R}(s) = (V_C + V_R) / V_{in}');