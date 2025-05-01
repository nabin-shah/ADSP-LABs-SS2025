% Define the component values
L = 1e-3; % 1 mH
C = 1e-8; % 0.01 uF
R_values = [10, 47, 68]; % Test values for Rs

R = inf; %R is infinite

% Define the frequency range for the analysis
f_start = 1e2; % Start frequency: 100 Hz
f_end = 1e8;   % End frequency: 100 MHz
num_points = 10000; % Number of points
frequencies = logspace(log10(f_start), log10(f_end), num_points); % Logarithmic spacing
omega = 2 * pi * frequencies; % Convert frequency to radians/second

% Initialize figure
figure;

% Loop through each Rs value
for i = 1:length(R_values)
    Rs = R_values(i);

    % Calculate the transfer function H(s) for the current Rs
    s = 1j * omega; % Laplace variable
    H = (s*L) ./ (L*C*Rs.*s.^2 + (L + (L*Rs)/R).*s + Rs); % Corrected Transfer Function.

    % Calculate the magnitude and phase of the transfer function
    magnitude_dB = 20 * log10(abs(H));
    phase_deg = rad2deg(angle(H));

    % Plot the frequency response
    subplot(2, 1, 1); % Magnitude plot
    semilogx(omega, magnitude_dB);
    hold on;
    title('Magnitude Response');
    xlabel('Frequency [rad/s]');
    ylabel('Magnitude [dB]');
    grid on;
    xlim([1e3, 1e8]); % Set x-axis limits

    subplot(2, 1, 2); % Phase plot
    semilogx(omega, phase_deg);
    hold on;
    title('Phase Response');
    xlabel('Frequency [rad/s]');
    ylabel('Phase [deg]');
    grid on;
    xlim([1e3, 1e8]); % Set x-axis limits
end

% Add legend
subplot(2, 1, 1);
legend(['Rs = ' num2str(R_values(1)) ' Ohm', ...
        'Rs = ' num2str(R_values(2)) ' Ohm', ...
        'Rs = ' num2str(R_values(3)) ' Ohm']);
hold off;

subplot(2,1,2);
legend(['Rs = ' num2str(R_values(1)) ' Ohm', ...
        'Rs = ' num2str(R_values(2)) ' Ohm', ...
        'Rs = ' num2str(R_values(3)) ' Ohm']);
hold off;
