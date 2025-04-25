%1. Replace the cosine with a sine function. 

fs = 700; % low sampling rate
f0 = 200; % base frequency
fa = 28000; % audio sampling rate
ts = [0:1/fs:1]; % sampling times (1 sec)

for k = 4:-1:-4
    fk = f0 + k*fs;
    disp(['Playing aliased frequency: ', num2str(fk), ' Hz']);
    x = sin(2*pi*fk*ts); % sample cosine at fs
    y = upconv(x, 1/fs, fa/fs); % upconvert to fa
    sound(y, fa);
    pause(1.2);
end
