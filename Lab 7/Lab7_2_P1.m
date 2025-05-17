 R = 100; C = 10e-9; L=10e-3;

 % one stage 
 num=[1];
 den=[L*C,0,1];

 sys1=tf(num,den);

 % two stage 
 num1= [R*L*C,L,R];
 den1= [R*L*L*C*C,L*L*C,3*R*L*C,2*L,R]

 sys2=tf(num1,den1);

 bode(sys1,sys2);
 grid minor;
 legend('1-stage','2-stage');