L3=100e-6;
C3=0.1e-6;
L1=1e-3;
L2=1e-3;
C1=0.01e-6;
C2=0.01e-6;

% Build the denominator coefficients of H(s) = 1 / D(s)
% D(s) = a6*s^6 + a4*s^4 + a2*s^2 + a0

a6 =  L1*L2*L3*C1*C2*C3;
a5 = 0;  % no s^5 term
a4 =  C1*C2*L1*L2   + C1*C3*L1*L2   + C1*C3*L1*L3 + C2*C3*L1*L3 + C2*C3*L2*L3;
a3 = 0;  % no s^3 term
a2 =  C1*L1 + C2*L1 + C2*L2 + C3*L1 + C3*L2 + C3*L3;
a1 = 0;  % no s term
a0 = 1;

% Numerator is just 1
num = [1];

% Denominator polynomial coefficients [a6 a5 a4 a3 a2 a1 a0]
den = [a6, a5, a4, a3, a2, a1, a0];

% Create the transfer function
systf = tf(num, den);

bode(systf);
grid minor;
title('Q5-2- Option C');