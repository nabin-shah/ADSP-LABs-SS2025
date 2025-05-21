% Shelving filter parameters
R = 470;            % ohm
C = 0.01e-6;        % F
Rfb = 20e3;         % feedback/top resistor
Rin = 20e3;         % input/inverting resistor

% Compute gains and corner
G_low  = 1;                         % low-freq gain
G_high = 1 + Rfb/Rin;               % high-freq gain = 1 + 20k/20k = 2
w0     = 1/(R*C);                   % rad/s
f0     = w0/(2*pi);                 % Hz

fprintf('Low-freq gain  = %.1f (%.1f dB)\n', G_low, 20*log10(G_low));
fprintf('High-freq gain = %.1f (%.1f dB)\n', G_high, 20*log10(G_high));
fprintf('Shelf corner   = %.1f kHz\n', f0/1e3);

% Transfer function H(s) = (G_low + (G_high - G_low)*s/(w0)) / (1 + s/(w0))
% Equivalent form: numerator = [ (G_high-G_low)/w0, G_low ]
%                  denom     = [ 1/w0,       1    ]
num = [ (G_high - G_low)/w0,  G_low ];
den = [       1/w0,            1    ];

sys = tf(num, den);

% Bode plot
figure;
bode(sys, {w0/100, w0*1000})
grid on
title('Bode Plot of First-Order High-Shelf Filter')

% Annotate with shelf gains and corner
hold on
mag_low  = 20*log10(G_low);
mag_high = 20*log10(G_high);
semilogx([w0/100, w0/10], [mag_low, mag_low], 'b--','LineWidth',1);
semilogx([w0*10, w0*1000], [mag_high, mag_high], 'r--','LineWidth',1);
semilogx([w0, w0],[mag_low, mag_high],'k:','LineWidth',1);
text(w0/10, mag_low+1, sprintf(' 0 dB shelf'));
text(w0*50, mag_high+1, sprintf(' +6 dB shelf'));
text(w0*1.1, mag_low + (mag_high-mag_low)/2, sprintf(' f_0 = %.1f kHz', f0/1e3));
hold off