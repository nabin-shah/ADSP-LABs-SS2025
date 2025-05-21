% Component values
f0 = 40060.95;  Q = 0.70761;
w0 = 2*pi*f0;
% Ideal TF
numI = [0 0 w0^2];
denI = [1 w0/Q w0^2];
sysI = tf(numI, denI);

% OP27 model (single pole at GBW)
GBW = 8e6;  wt = 2*pi*GBW;
A0 = 1e5;   % large DC gain
sysOL = tf(A0*[1], [1 wt]);

% Build nonideal SK loop (use bode to see effect; see MATLAB docs for sk implementation)
% For simplicity you can approximate G_real by series cascading sysI with 1/(1 + s/wt)
sysR = series(sysI, tf([1], [1 wt]));

% Bode over 1k–1M
f = logspace(3, 6, 500);
bode(sysI, sysR, 2*pi*f), grid minor;
legend('Ideal','With GBW limit')