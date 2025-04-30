% frequency response of RLC circuit in Fig 5
R = 100;
L = 1e-3;
C = 10e-9;

% s = [ v_C1, v_C2, i_L ]' % Order of state variables seems different
A = [ -1/(R*C), 0, -1/C;
      0, 0, 1/L;
      1/C, -1/L, 0 ];
B = [ 1/(R*C); 0; 0 ];
C = [ -1, 0, 0 ];
D = 1;

sys = ss(A,B,C,D);
bode(sys);
grid on;