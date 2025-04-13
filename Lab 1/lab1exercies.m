
Ts= 1e-3;    %sample period =1ms 
f0=10;       %fundamental frequency
t=[0:Ts:1];
x= cos(2*pi*f0*t); %cosine signal

%create two figures
figure(1) %Open figure 1
plot(t,x);
title('Figure 1: Cosine Signal');

figure(2); %Open figure 2
plot(t,x,'r--');
title('Figure 2');

%Use subplot in a new figure
figure(3);
subplot(2,1,1) % 2 rows, 1 column, first subplot 
plot(t,x);
title('subplot 1:Cosine signa');

subplot(2,1,2) % 2 rows, 1 column, second subplot
plot(t,x, 'g:'); %green dotted line
title('Subplot 2: Cosine Signal ')


