function y = upconv(x, Ts, M)
    % upconversion of signal x by M
    % x = sampled signal
    % Ts = sampling period of x
    % M = upsampling factor (must be integer)

    L = 42 * M; % L = one-sided sinc length
    N = length(x); % number of samples in x
    y = zeros(1, (N-1)*M+1); % space for upsampled signal

    y(1:M:end) = x; % insert zeros between samples

    s = sinc([-L:L] / M); % low-pass filter using truncated sinc
    y = conv(y, s, 'same'); % convolution with LPF
end
