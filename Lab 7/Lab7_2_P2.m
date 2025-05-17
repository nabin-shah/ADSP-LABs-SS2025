 R = 100; C = 10e-9; L=10e-3;

 % one stage 
 num1=1;
 den1=[L*C,0,1];

 sys1=tf(num1,den1);

 % second stage
 num2=[R];
 den2= [R*L*C,L,R];

 sys_2=tf(num2,den2);

 % second stage transfer function
 sys2=sys1*sys_2;

 bode(sys1,sys2);
 grid minor;


