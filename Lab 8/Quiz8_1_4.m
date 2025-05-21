% COMPONENTS
R1 = 3.95e3;   R2 = 102e3;
C1 = 1e-9;     C2 = 100e-12;
K  = 1.414;            % ideal closed-loop DC gain

% OP27 open-loop
A0 = 1e5;             % DC gain
ft = 8e6;             % GBW
wp = 2*pi*ft/A0;      % pole rad/s
Aol = tf([A0],[1, wp]);

% Build the Sallen–Key passive network block G(s) = 1/(R1R2C1C2 s^2 + ... +1)
G = tf(1,[R1*R2*C1*C2, ( (1-K)*R1*C1 + R1*C2 + R2*C2 ), 1]);

% Now close the loop: the op amp drives the passive G(s) with finite Aol:
%            _______        ______
%    +---(+) |     |------| G(s) |----+
%    | Vin     Aol(s)      ‾‾‾‾‾       |
%    |                                  |
%    +----------------------------------+
sys_real = feedback( Aol*G, 1 );    % unity feedback around G

% Ideal filter for comparison
sys_ideal= tf(K, [R1*R2*C1*C2, ( (1-K)*R1*C1 + R1*C2 + R2*C2 ), 1]);

% Plot both
w = logspace(3,8,1000);
[mag_real,~,~]  = bode(sys_real, w);
mag_real_dB    = squeeze(20*log10(mag_real));
[mag_id,~,~]   = bode(sys_ideal, w);
mag_id_dB      = squeeze(20*log10(mag_id));

figure
semilogx(w, mag_id_dB, 'b--', 'LineWidth',1.5)
hold on
semilogx(w, mag_real_dB,'r','LineWidth',1.5)
grid on
xlabel('Frequency (rad/s)')
ylabel('Magnitude (dB)')
legend('Ideal SK','Finite-GBW OP27','Location','SouthWest')
title('Filter response: Ideal vs. Real OP27')

% Find frequency where |ΔMag| > 0.1 dB
delta = abs(mag_real_dB - mag_id_dB);
idx  = find(delta>0.1,1);
fprintf('Deviation >0.1 dB starts at f = %.2e rad/s (%.2f kHz)\n',...
         w(idx), w(idx)/(2*pi)/1e3);