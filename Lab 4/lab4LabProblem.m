%Lab Problem

f0 = 400; % base frequency 
fa = 28000; %audio rate 

sampling_rates = [ 1800,1200,900,720,600];

for i=1:length(sampling_rates)
    fs=sampling_rates(i);
    

    M=round(fa/fs); %enfore integer upsampling factor
    fs=fa/M; % adjust fs to be compatible 
    N=floor(fs*1);  %number of samples for 1 second
    %ts =0:1/fs:1;
    ts=(0:N)/fs;

    %composite signal
    x= 0.5 * (cos(2*pi*f0*ts) + sin(2*pi*2*f0*ts));

    %upconvert for audio playback
    y=upconv(x,1/fs,M);
    disp(['Playing for fs= ', num2str(fs),' Hz']);
    sound(y,fa);
    pause(1.2);
end