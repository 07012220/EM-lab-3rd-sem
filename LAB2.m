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
a=30;
x0=450;
k=50;
c1=((x-x0)-a*cosd(z)).^2+(h-a*sind(z)).^2;
d1=((x-x0)+a*cosd(z)).^2+(h+a*sind(z)).^2;
V=k*log(c1./d1);

subplot(1,3,1);
plot(x,V,"k*",x1,sp1,"r");
legend('Modeled','Measured');
xlabel('Distance');
ylabel('SP1 anomaly (in mV)');
error1=sp1-V';
sq1=error1.^2;
avg1=mean(sq1);
rms1=avg1.^0.5;


%For SP2

z=45;
x=0:5:800;
h=40;
a=30;
x0=450;
k=50;

c1=((x-x0)-a*cosd(z)).^2+(h-a*sind(z)).^2;
d1=((x-x0)+a*cosd(z)).^2+(h+a*sind(z)).^2;
V=k*log(c1./d1);

subplot(1,3,2);
plot(x,V,"k*",x1,sp2,"r");
legend('Modeled','Measured');
xlabel('Distance');
ylabel('SP2 anomaly (in mV)');
error2=sp2-V';
sq2=error2.^2;
avg2=mean(sq2);
rms2=avg2.^0.5;

%For SP3

z=135;
x=0:5:800;
h=40;
a=30;
x0=350;
k=100;

c1=((x-x0)-a*cosd(z)).^2+(h-a*sind(z)).^2;
d1=((x-x0)+a*cosd(z)).^2+(h+a*sind(z)).^2;
V=k*log(c1./d1);

subplot(1,3,3);
plot(x,V,"k*",x1,sp3,"r");
legend('Modeled','Measured');
xlabel('Distance');
ylabel('SP3 anomaly (in mV)');
error3=sp3-V';
sq3=error3.^2;
avg3=mean(sq3);
rms3=avg3.^0.5;
