% --- MATLAB script for Question 7 ---

% Define input signal parameters
V0_amp = 1.0;     % Amplitude of v0(t) in Volts (matches x1(t))
f0_freq = 5000;   % Frequency of v0(t) in Hz (5 kHz)

Vc_amp = 3.0;     % Amplitude of vc(t) in Volts (matches x2(t))
fc_freq = 50000;  % Frequency of vc(t) in Hz (50 kHz)

% Define parameters for the AM output signal (v_out(t))
% v_out(t) = Ac * (1 + m*cos(2*pi*f0*t)) * cos(2*pi*fc*t)
m_modulation_index = 0.5; % Modulation index (chosen to match x3(t) shape)
% Let peak of v_out(t) be around 1V (similar to V0_amp)
Ac_carrier_amp = (1.0) / (1 + m_modulation_index); % Ac * (1+m) = 1V peak

% Define time vector for plotting
sampling_freq = 1000000; % High sampling frequency for smooth 50kHz carrier
end_time = 2 / f0_freq;   % Plot duration for 2 cycles of the 5kHz modulating signal
t_vector = 0 : (1/sampling_freq) : end_time; % Time array

% Generate the signals
v0_signal = V0_amp * cos(2*pi*f0_freq*t_vector);
vc_signal = Vc_amp * cos(2*pi*fc_freq*t_vector);
vout_signal_am = Ac_carrier_amp * (1 + m_modulation_index * cos(2*pi*f0_freq*t_vector)) .* cos(2*pi*fc_freq*t_vector);
% Note: Using .* for element-wise multiplication for the envelope and carrier

% Create plots
figure;

% Plot for v0(t) - Expected to match x1(t)
subplot(3,1,1);
plot(t_vector * 1000, v0_signal); % Time in ms
title(sprintf('v_0(t) = %.1fV cos(2\\pi %.0fkHz t) (Matches x_1(t))', V0_amp, f0_freq/1000));
xlabel('Time (ms)');
ylabel('Amplitude (V)');
grid on;
ylim([-V0_amp*1.2, V0_amp*1.2]);

% Plot for vc(t) - Expected to match x2(t)
subplot(3,1,2);
plot(t_vector * 1000, vc_signal); % Time in ms
title(sprintf('v_c(t) = %.1fV cos(2\\pi %.0fkHz t) (Matches x_2(t))', Vc_amp, fc_freq/1000));
xlabel('Time (ms)');
ylabel('Amplitude (V)');
grid on;
ylim([-Vc_amp*1.2, Vc_amp*1.2]);

% Plot for v_out(t) - AM with large carrier, expected to match x3(t)
subplot(3,1,3);
plot(t_vector * 1000, vout_signal_am); % Time in ms
title(sprintf('v_{out}(t) - AM Large Carrier (Matches x_3(t)), Ac=%.2fV, m=%.1f', Ac_carrier_amp, m_modulation_index));
xlabel('Time (ms)');
ylabel('Amplitude (V)');
grid on;
ylim([-Ac_carrier_amp*(1+m_modulation_index)*1.2, Ac_carrier_amp*(1+m_modulation_index)*1.2]);

sgtitle('Waveform Verification for Quiz Question 7');