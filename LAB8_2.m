clear all
close all
clc

M=csvread('data_vlf.csv');
x0=M(:,1);
delH_model2=M(:,3);


x1_i=495;
x2_i=550;

z1=41;
z2=56;
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

error2=delH-delH_model2;
sq2=error2.^2;
avg2=mean(sq2);
rms2=avg2.^0.5;

plot(x0,delH,"k",x0,delH_model2,"r");
legend('Theoretical','Measured');
title('VLF data modelling for dataset 2');
ylabel('Intensity of magnetisation H (in A/m) ');
xlabel('Profile length (in m)');
grid on;
