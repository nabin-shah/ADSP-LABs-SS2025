% Define component values (same as before)
R = 100;
L = 1e-3;
C = 10e-9;

% Define state-space matrices
A = [-R/L, -1/L; 1/C, 0];
B = [1/L; 0];
C_out = [-R, 0];  % Note: Using C_out to avoid confusion with C (capacitance)
D = 1;

% Create state-space system
sys_ss = ss(A, B, C_out, D);

%Plot the step response 
step(sys_ss);
grid on;
title('Step Response of RLC Circuit');
xlabel('Time [seconds]');
ylabel('Output voltages[V]'); %Assuming input step is in volts