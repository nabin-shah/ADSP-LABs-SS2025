% Original parameters
f0 = 200;                   % Signal frequency (Hz)
Ts_ref = 0.001;             % Reference sampling period (1 ms)
duration = 100;             % Extended duration (seconds) to capture more samples
t_ref = 0:Ts_ref:duration;  % Extended time vector for reference signal
x_ref = cos(2*pi*f0*t_ref); % Reference signal

% Test sampling periods
% Ts_test = [0.003, 0.004, 0.005, 10.001]; 
% Ts_test = [0.006, 0.007, 0.008, 0.099]; % 6ms, 7ms, 8ms, 99ms
Ts_test = [0.009, 0.010, 0.011, 1]; 

% Plot reference signal (first 100 samples)
figure;
subplot(length(Ts_test)+1, 1, 1);
n_ref = 0:100; % Plot first 100 samples
stem(n_ref, x_ref(1:length(n_ref))); grid on;
title('Reference: T_s = 1 ms');
xlabel('n'), ylabel('x_{ref}[n]');

% Check each test Ts
for i = 1:length(Ts_test)
    Ts = Ts_test(i);
    t = 0:Ts:duration;      % Extended time vector for test signal
    x = cos(2*pi*f0*t);     % Sampled signal
    
    % Compute normalized frequency
    f_norm = f0 * Ts; 
    f_norm_mod = mod(f_norm, 1); % Modulo 1
    
    % Check if indistinguishable
    if abs(f_norm_mod - 0.2) < 1e-6 || abs(f_norm_mod - 0.8) < 1e-6
        result = 'INDISTINGUISHABLE';
    else
        result = 'Distinguishable';
    end
    
    % Plot first 100 samples (or all if fewer)
    subplot(length(Ts_test)+1, 1, i+1);
    n = 0:min(100, length(x)-1); 
    stem(n, x(1:length(n))), grid on;
    title(sprintf('T_s = %.3f s: %s (f_{norm} = %.2f)', Ts, result, f_norm_mod));
    xlabel('n'), ylabel('x[n]');
end