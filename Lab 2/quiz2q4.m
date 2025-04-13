clear;
L=1e-3;   % Henry (1 mH)
C=100e-9;  %Farad(10 nF)

%Define State-Space Matrix
% A= [ 0, 1/C;
%     -1/L, 0];
% 
% B= [0; 1/L];
% 
% C= [1, 0];
% D=0;

A = [0, -1/L;
     1/C, 0];
B = [1/L; 0];
C = [0, 1];  % Renamed to avoid conflict with ss() output
D = 0;


%Create the state space model (Use the ss function)
sys=ss(A,B,C,D);

%simulate the step Response
%Simulate unit step response using the step function 
step(sys,0.0001);  %change the inverval as per need. time will start from 0 till 0.0001
grid on;