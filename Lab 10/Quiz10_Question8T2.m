% --- MATLAB script for Question 8 (Updated for Combined Plot) ---
% To compare output spectra with and without DC offsets

% Signal Parameters (from Q8 context, similar to Q5/Q7)
V0_amp = 1.0;     % AC Amplitude of v0(t)
f0_freq = 5000;   % Frequency of v0(t) in Hz (5 kHz)
Vc_amp = 3.0;     % AC Amplitude of vc(t)
fc_freq = 50000;  % Frequency of vc(t) in Hz (50 kHz)

% DC Offsets for Case 2
V0_dc_offset_case2 = 1.0; % DC offset for v0(t)
Vc_dc_offset_case2 = 0.5; % DC offset for vc(t)

% Simulation Parameters
fs = 1e6;         % Sampling frequency (1 MHz)
N = 2^15;         % Number of points for FFT (32768)
t_vector = (0:N-1)'/fs; % Time vector (column vector)

% --- Case 1: No DC Offsets ---
v0_case1 = V0_amp * cos(2*pi*f0_freq*t_vector);
vc_case1 = Vc_amp * cos(2*pi*fc_freq*t_vector);
% v1 is the signal at the diode anode after summing resistors
v1_case1 = (1/3) * (v0_case1 + vc_case1);

% --- Case 2: With DC Offsets ---
v0_case2 = V0_amp * cos(2*pi*f0_freq*t_vector) + V0_dc_offset_case2;
vc_case2 = Vc_amp * cos(2*pi*fc_freq*t_vector) + Vc_dc_offset_case2;
v1_case2 = (1/3) * (v0_case2 + vc_case2); % Includes effective DC offset at v1

% Simplified Diode Nonlinearity Model (current proportional to v1 and v1^2)
% i_diode = k1*v1 + k2*v1^2
k1 = 0.1;  % Coefficient for linear term (carrier feedthrough)
k2 = 0.05; % Coefficient for quadratic term (mixing)

i_mixed_case1 = k1*v1_case1 + k2*(v1_case1.^2);
i_mixed_case2 = k1*v1_case2 + k2*(v1_case2.^2);

% LC Band-Pass Filter Design (Parallel RLC, current in, voltage out)
% Using L, C, R from Question 5, Option 2 (which had suitable bandwidth)
L_filter = 10e-3;  % 10 mH
C_filter = 1e-9;   % 1 nF
R_load = 10e3;     % 10 kOhm output resistor (acts as load for LC tank)

% Transfer function Z(s) = V_out(s)/I_in(s) = (sL) / (s^2*LC + s*(L/R_load) + 1)
num_tf = [L_filter 0];
den_tf = [L_filter*C_filter L_filter/R_load 1];
bpf_sys = tf(num_tf, den_tf);

% Apply the filter
vout_case1 = lsim(bpf_sys, i_mixed_case1, t_vector);
vout_case2 = lsim(bpf_sys, i_mixed_case2, t_vector);

% --- FFT Analysis ---
freq_vector = (-N/2:N/2-1)*(fs/N); % Frequency vector for plotting

% FFT for Case 1
Vout_fft_case1 = fft(vout_case1);
Vout_fft_case1_shifted = fftshift(Vout_fft_case1);
P_case1_dB = 20*log10(abs(Vout_fft_case1_shifted/N)); % Magnitude in dB

% FFT for Case 2
Vout_fft_case2 = fft(vout_case2);
Vout_fft_case2_shifted = fftshift(Vout_fft_case2);
P_case2_dB = 20*log10(abs(Vout_fft_case2_shifted/N)); % Magnitude in dB

% --- Plotting (Combined Spectrum Plot) ---
figure;
plot(freq_vector/1000, P_case1_dB, 'b-', 'LineWidth', 1.5); % Case 1: Solid blue line
hold on; % Hold the plot for the next spectrum
plot(freq_vector/1000, P_case2_dB, 'r--', 'LineWidth', 1.5); % Case 2: Dashed red line

title('Comparison of Output Spectra');
xlabel('Frequency (kHz)');
ylabel('Magnitude (dB)');
xlim([0 fc_freq*1.5/1000]); % Focus on region around carrier (0 to 75 kHz)
ylim([-120 0]); % Adjust ylim as needed, can be dynamic based on data
grid on;

% Mark important frequencies (adjust y-position for clarity if needed)
marker_y_pos = -110; % Y position for markers/text, adjust as needed
plot([f0_freq, fc_freq-f0_freq, fc_freq, fc_freq+f0_freq]/1000, ...
     [marker_y_pos marker_y_pos marker_y_pos marker_y_pos], ...
     'kv', 'MarkerFaceColor','k', 'MarkerSize', 5);
text([f0_freq, fc_freq-f0_freq, fc_freq, fc_freq+f0_freq]/1000, ...
     [marker_y_pos-5 marker_y_pos-5 marker_y_pos-5 marker_y_pos-5], ... % Text slightly below markers
    {'f_0', 'f_c-f_0', 'f_c', 'f_c+f_0'}, ...
    'VerticalAlignment','top', 'HorizontalAlignment','center', 'FontSize', 8);

legend('Case 1: No DC Offsets', 'Case 2: With DC Offsets', 'Location', 'northeast');
hold off;

sgtitle('Output Spectra Comparison for Question 8');