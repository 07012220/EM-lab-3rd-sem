clear all
close all
clc

dataset=csvread('data_sp.csv');
x1=dataset(:,1);
sp1=dataset(:,2);
sp2=dataset(:,3);
sp3=dataset(:,4);

%For SP1

z=135;
x=0:5:800;
h=40;
a=90;
x0=450;
k=40;
c1=((x-x0)-a*cosd(z)).^2+(h-a*sind(z)).^2;
d1=((x-x0)+a*cosd(z)).^2+(h+a*sind(z)).^2;
V=k*log(c1./d1);

plot(x,V,"k*",x1,sp1,"r");
xlabel('Distance');
ylabel('SP anomaly (in m)');
legend('Modeled','Measured');
error1=sp1-V;
sq1=error1.^2;
avg1=mean(sq1);
rms1=avg1.^0.5;