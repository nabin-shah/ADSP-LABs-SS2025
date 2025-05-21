% Parameters
R   = 1e3;               % Ω
C   = 0.01e-6;           % F
tau = R*C;               % s

% Candidate frequencies (Hz)
f = [7.6e3, 17e3, 36e3];

% Compute phase φ(f) = –atan(2πf·τ) in degrees
phi = -atan(2*pi*f*tau) * (180/pi);

% Compute error from –90°
err = abs(phi + 90);

% Display results
fprintf('  f (kHz)    phase (deg)    |φ+90| (deg)\n');
for k=1:3
    fprintf('  %6.1f      %7.2f         %7.2f\n', f(k)/1e3, phi(k), err(k));
end

% Find the best match
[~,idx] = min(err);
fprintf('\nClosest to –90° is f = %.1f kHz (phase = %.2f°)\n', f(idx)/1e3, phi(idx));