% Parameters
f0 = 200;             % base frequency in Hz
K = 3;                % number of periods to plot
Ts_ref = 0.001;       % reference Ts = 1ms

% Generate reference signal
t_ref = 0:Ts_ref:1;
x_ref = cos(2*pi*f0*t_ref);
N_ref = round(K / (Ts_ref * f0));
x_ref = x_ref(1:N_ref);

% Sampling periods to test
Ts_values = [0.006, 0.007, 0.008, 0.099]; % 6ms, 7ms, 8ms, 99ms
% Ts_values = [0.003, 0.004, 0.005, 10.001];
% Ts_values = [0.003, 0.004, 0.005,0.006, 0.007, 0.008, 0.099, 10.001];

% Create figure
figure;
sgtitle('Stem Plots: Reference (Ts=1ms) vs Test Ts');

for i = 1:length(Ts_values)
    Ts_test = Ts_values(i);
    t_test = 0:Ts_test:1;
    x_test = cos(2*pi*f0*t_test);
    N_test = round(K / (Ts_test * f0));
    x_test = x_test(1:N_test);

    % Compare signals
    N_common = min(length(x_ref), length(x_test));
    is_same = isequal(round(x_ref(1:N_common), 10), round(x_test(1:N_common), 10));
    
    % Print result
    if is_same
        disp(['✅ Ts = ', num2str(Ts_test*1000), ' ms: Indistinguishable']);
    else
        disp(['❌ Ts = ', num2str(Ts_test*1000), ' ms: Distinguishable']);
    end
    
    % Plot reference and test signals
    subplot(length(Ts_values), 2, 2*i-1);
    stem(0:N_common-1, x_ref(1:N_common), 'filled');
    xlabel('n'), ylabel('x_{ref}[n]');
    title(['Reference Ts=1ms']);
    grid on;

    subplot(length(Ts_values), 2, 2*i);
    stem(0:N_common-1, x_test(1:N_common), 'filled');
    xlabel('n'), ylabel(['x_{test}[n]']);
    title(['Test Ts=', num2str(Ts_test*1000), 'ms']);
    grid on;
end
