% compare_sallen_key.m
clear; clc; close all;

%% Parameters
f0  = 10007.409623332;        % cutoff frequency [Hz]
Q   = 0.70690445676755;       
w0  = 2*pi*f0;                % natural radian freq

GBW = 8e6;                    % OP27 gain-bandwidth [Hz]
wt  = 2*pi*GBW;               % OP27 pole [rad/s]
A0  = 1e5;                    % OP27 DC open-loop gain

K   = 1 + 8.28/20;            % DC closed-loop gain = 1.414

%% 1) Ideal SK transfer function
numI = K * [     w0^2 ];
denI =      [1  w0/Q    w0^2];
sysIdeal = tf(numI, denI);

%% 2) Real SK closed-loop with finite GBW
% Open-loop op-amp A(s) = A0 / (1 + s/omega_t)
sysOL = tf([A0], [1 wt]);

% Passive unity-gain 2nd-order network (as seen by the op-amp)
sysPass = tf([    w0^2], [1  w0/Q   w0^2]);

% Forward path: K (gain block) -> passive 2nd-order -> op-amp OL
sysForward = series(sysPass, K);
sysLoop    = series(sysOL, sysForward);

% Close the loop around unity feedback
sysReal = feedback(sysLoop, 1);

%% 3) Frequency sweep & dB difference
f     = logspace(3, 6, 2000);   % 1 kHz -> 1 MHz
w     = 2*pi*f;

[magI, ~] = bode(sysIdeal, w);  magI = squeeze(magI);
[magR, ~] = bode(sysReal,  w);  magR = squeeze(magR);

dB_I    = 20*log10(magI);
dB_R    = 20*log10(magR);
dB_diff = abs(dB_R - dB_I);

%% --- Find first ≥0.5 dB deviation **above** 2*f0 ------------------
mask = (f > 2*f0) & (dB_diff >= 0.5);
idxList = find(mask);
if isempty(idxList)
    fprintf('No ≥0.5 dB deviation up to %.0f kHz.\n', f(end)/1e3);
    f_break = NaN;
else
    idx = idxList(1);          % first index
    if idx > numel(f)
        idx = numel(f);        % safety clamp
    end
    f_break = f(idx);
    fprintf('First ≥0.5 dB deviation at f = %.0f Hz\n', f_break);
end

%% 4) Plot
figure('Color','w','Position',[200 200 700 400]);
semilogx(f, dB_I, 'b-', 'LineWidth',1.5); hold on
semilogx(f, dB_R, 'r--','LineWidth',1.5);

if ~isnan(f_break)
    xline(f_break,'k--',sprintf('0.5 dB @ %.0f Hz',f_break), ...
          'LabelVerticalAlignment','bottom',...
          'LabelHorizontalAlignment','right');
end

grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Ideal vs Real Sallen–Key (with OP27 GBW)');
legend('Ideal SK','Real SK','Location','SouthWest');