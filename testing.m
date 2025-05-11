% RC filter parameters
R = 2.2e3;         % Resistance in Ohms
C = 0.047e-6;      % Capacitance in Farads

% Define the transfer function
s = tf('s');
H = (R*C*s) / (1 + R*C*s);

% Frequencies to test (Hz)
freqs = [1e3, 10e3, 100e3];

% Time settings for clear visualization (at least several periods)
periods = 5;   % Number of periods to simulate for each freq

for i = 1:length(freqs)
    f = freqs(i);
    T = 1/f;                 % Period
    t = 0:1e-6:periods*T;    % Time vector (1 us steps)
    vin = sin(2*pi*f*t);     % Input sine wave

    % Simulate filter output
    vout = lsim(H, vin, t);

    % Plot input and output
    figure;
    plot(t*1e3, vin, '--', 'LineWidth', 1.5); hold on;
    plot(t*1e3, vout, 'LineWidth', 1.5);
    xlabel('Time (ms)');
    ylabel('Voltage (V)');
    title(sprintf('RC High-Pass Filter: Input vs Output at %.0f Hz', f));
    legend('Input (Vin)', 'Output (Vout)');
    grid on;
end