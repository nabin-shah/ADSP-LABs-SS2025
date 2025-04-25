fa = 28000; % audio sampling rate
ta = [0:1/fa:1]; % sampling times for 1 second of sound

fs = 700; % sampling rate
f0 = 200; % frequency of pure tone

ts = [0:1/fs:1]; % sampling times for 1 second of sound

function y = upconv(x, Ts, M)
    % upconversion of signal x by M
    % x = sampled signal
    % Ts = sampling period of x
    % M = upsampling factor (must be integer)
    L = 42 * M; % L = one-sided sinc length
    N = length(x); % N = samples in x
    y = zeros(1, (N-1)*M+1); % make space for M-1 zeros between samples
    y(1:M:end) = x; % upsampling: insert zeros
    s = sinc([-L:L] / M); % LPF with truncated sinc
    y = conv(y, s, 'same'); % mode ’same’ clips the convolution
end

%play sound
sound(upconv(x, 1/fs, fa/fs), fa);