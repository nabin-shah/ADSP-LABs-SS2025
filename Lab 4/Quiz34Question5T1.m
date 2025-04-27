% Define the continuous-time signal x(t) as an anonymous function
% x(t) = cos(200*pi*t) + (1/2)*sin(400*pi*t) + (1/3)*cos(600*pi*t) + (1/4)*sin(800*pi*t) + (1/5)*cos(1000*pi*t)
xt = @(t) cos(200*pi*t) + (1/2)*sin(400*pi*t) + (1/3)*cos(600*pi*t) + (1/4)*sin(800*pi*t) + (1/5)*cos(1000*pi*t);
% % testing another signal
% xt = @(t) sin(200*pi*t) + (1/4)*cos(400*pi*t) + (1/9)*sin(600*pi*t) + (1/16)*cos(800*pi*t) + (1/25)*sin(1000*pi*t);

% Define the time range for plotting (matching the example)
t_end = 0.03; % seconds

% --- Optional: Plot the original continuous-time signal for reference ---
figure; % Create a new figure window for the original signal
t_continuous = linspace(0, t_end, 1000); % Create a fine time vector for a smooth plot
plot(t_continuous, xt(t_continuous), 'LineWidth', 1.5);
title('Original Continuous-Time Signal x(t)');
xlabel('t [s]');
ylabel('x(t)');
grid on;
ylim([-2, 2]); % Set y-axis limits similar to the example

% --- Define the sampling frequencies to test ---
fs_values = [500, 400, 300, 100]; % Hz
% fs_values = [200, 400, 300, 100]; % Hz

% --- Loop through each sampling frequency ---
for i = 1:length(fs_values)
    fs = fs_values(i); % Current sampling frequency
    Ts = 1/fs;         % Corresponding sampling period

    % Generate the discrete sampling time instances from 0 to t_end
    tn = 0:Ts:t_end;

    % Calculate the sampled signal values at the sampling instances
    xn = xt(tn);

    % --- Create a new figure for each sampled signal plot ---
    figure;

    % Plot the discrete sampled points using stem
    % 'filled' makes the markers solid
    % 'MarkerSize' controls the size of the markers
    % 'LineStyle', 'none' hides the lines connecting stems to the axis
    stem(tn, xn, 'filled', 'MarkerSize', 4, 'LineStyle', 'none', 'Color', [0 0.4470 0.7410]); % Blue markers

    hold on; % Keep the stem plot when adding the interpolated line

    % Plot the linearly interpolated signal by connecting the sample points
    % '-o' creates a line with circle markers at each sample point
    plot(tn, xn, '-o', 'LineWidth', 1, 'MarkerSize', 4, 'Color', [0 0.4470 0.7410]); % Blue line and markers

    % --- Optional: Plot the original signal outline for comparison ---
    % plot(t_continuous, xt(t_continuous), 'r--', 'LineWidth', 0.5); % Dashed red line

    hold off; % Release the plot hold

    % --- Add labels, title, and formatting ---
    title(['Sampled and Linearly Interpolated Signal, fs = ', num2str(fs), ' Hz']);
    xlabel('t [s]');
    ylabel('x[n] / Interpolated x(t)');
    grid on;
    ylim([-2, 2]); % Match y-axis limits of the original plot
    xlim([0, t_end]); % Ensure x-axis covers the desired time range

    % Add legend (adjust if you uncomment the original signal plot)
    legend('Sampled Points', 'Linearly Interpolated');
    % legend('Sampled Points', 'Linearly Interpolated', 'Original Signal (Reference)'); % Use this if original is plotted

end

disp('Finished generating plots for all sampling frequencies.');
