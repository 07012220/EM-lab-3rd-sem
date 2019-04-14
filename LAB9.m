[file, path] = uigetfile({'*'});
cd(path);
data = importdata(file);
period = data(:,1);
strike = data(:,2);
shear = data(:,3);
twist = data(:,4);
rhoa = data(:,5);
rhob = data(:,6);
phia = data(:,7);
phib = data(:,8);

subplot(2,2,1)
semilogx(period, shear, 'o');
ylim([-60, 60]);
xlabel('period');
ylabel('Twist/Shear');
hold on; 
semilogx(period, twist, 'o');
grid on; 
legend('shear', 'twist');
hold off;
 
subplot(2,2,2)
loglog(period, rhoa,'o');
hold on;
grid on;
loglog(period, rhob, 'o');
legend('rho XY', 'rho YX');
xlabel('period');
ylabel('Apparent Resistivity');
hold off; 

subplot(2,2,3)
semilogx(period, strike, 'o');
xlabel('period');
ylabel('Strike Angle');
ylim([-180, 180]);
legend('Strike Angle');
grid on;

subplot(2,2,4)
semilogx(period, phia,'o');
hold on;
semilogx(period, phib, 'o');
legend('phi XY', 'phi YX');
xlabel('period');
ylabel('Phase');
grid on;
hold off; 


