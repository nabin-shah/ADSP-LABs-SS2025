% Define component values
L = 0.001;    % Inductance in Henry (1 mH)
C = 0.01e-6;     % Capacitance in Farad (0.01 µF)
Rs = 10;      % Series resistance in Ohms (selected value)

% Define the transfer function using tf
s = tf('s');
H = (L * s) / (Rs * L * C * s^2 + L * s + Rs);

% Plot the Bode plot with specified frequency range
bodeplot(H, {1e4, 1e7});

% Customize the plot to match the image
h = findobj(gcf, 'Type', 'axes');
set(h(1), 'YLim', [-20, 0]);    % Magnitude axis limits (-20 dB to 0 dB)
set(h(2), 'YLim', [-80, 60]);   % Phase axis limits (-80° to 60°)
grid(h(1), 'on');               % Grid for magnitude plot
grid(h(2), 'on');               % Grid for phase plot
grid minor;

% Optional: Add titles and labels (uncomment if needed)
% title(h(1), 'Magnitude Response');
% title(h(2), 'Phase Response');
% xlabel(h(1), 'Frequency (rad/s)');
% xlabel(h(2), 'Frequency (rad/s)');
% ylabel(h(1), 'Magnitude (dB)');
% ylabel(h(2), 'Phase (deg)');