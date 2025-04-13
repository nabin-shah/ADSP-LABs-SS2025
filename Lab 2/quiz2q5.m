%Lab quiz 2-part 5
clear;
L = 10e-3;   % Henry (1 mH)
C = 100e-9; % Farad (100 nF)

% Define State-Space Matrix
% A = [0, 1/C;
%      -1/L, 0];
A = [0, -1/L;
     1/C, 0];
B = [1/L; 0];
C_matrix = [0, 1];  % Renamed to avoid conflict with ss() output
D = 0;

% Create the state space model
sys = ss(A, B, C_matrix, D);

% Get the step response data explicitly
[y, t] = impulse(sys, 3e-05);

% Create a new figure with custom settings
figure;
plot(t, y, 'LineWidth', 1.5);
grid on;
title('Impulse Response of LC Circuit');
xlabel('Time [s]');
ylabel('Voltage [V]');

% Set the axes properties
ylim([-300000 300000]);
yticks(-300000:100000:300000);  % Now this will work
xlim([0 t(end)]); % Automatically fit time axis