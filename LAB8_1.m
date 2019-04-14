clear all
close all
clc

M=csvread('data_vlf.csv');
x0=M(:,1);
delH_model1=M(:,2);

x1_i=400;
x2_i=450;

z1=20;
z2=40;
j=0.0025;
i=1;

while i<101

x2=-(x0(i)-x2_i);
x1=-(x0(i)-x1_i);

A=log( (x2^2 + z2^2)/(x1^2 + z2^2) );
B=log( (x2^2 + z1^2)/(x1^2 + z1^2) );
C=atan( x2*(z2-z1) / (x2^2 + z1*z2) );
D=atan( x1*(z2-z1)/(x1^2 + z1*z2) );

delH(i)=-(j/4*pi)*( z2*A - z1*B + 2*x2*C - 2*x1*D );
i=i+1;

end
delH=(delH')*10;

error1=delH-delH_model1;
sq1=error1.^2;
avg1=mean(sq1);
rms1=avg1.^0.5;

plot(x0,delH,"k",x0,delH_model1,"r");
legend('Theoretical','Measured');
title('VLF data modelling for dataset 1');
ylabel('Intensity of magnetisation H (in A/m) ');
xlabel('Profile length (in m)');
grid on;