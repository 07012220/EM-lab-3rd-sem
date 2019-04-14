clear all
close all
clc

Grho=csvread('data_mt_app.csv');
Gphase=csvread('data_mt_phase.csv');
% Grho=given rho; Gphase=given phase;
% 1st column-> frequency, 2nd column -> Model_1 Measured(rho OR phase)
% 3rd Column->  Model_2 Measured(rho OR phase)

% model 1 -> 3 layer case
% model 2 -> 4 layer case

f=Grho(:,1);
w=2*pi*f;

for jj=1:length(w)
    
model_1_Grho=Grho(:,2);
model_2_Grho=Grho(:,3);

model_1_Gphase=Gphase(:,2);
model_2_Gphase=Gphase(:,3);

mu=4*pi*10^(-7);
% rho=[500 20 1500 20];
% h=[1000 3000 2000 0];
rho=[500 20 1500 20];
h=[1000 3000 2000 0];

i=sqrt(-1);
n=4;
for j=1:n
k(j)=sqrt(-i*w(jj)*mu/rho(j));
end
Z(n)=i*w(jj)*mu/k(n);

j=n;
while j > 1
Z(j-1)=i*w(jj)*(mu/k(j))*coth( i*k(j)*h(j) + acoth( k(j)*Z(j)/(i*w(jj)*mu) ));
j=j-1;
end

j=1;
Z0=i*w(jj)*(mu/k(j))*coth( i*k(j)*h(j) + acoth( k(j)*Z(j)/(i*w(jj)*mu) ));

Arho(jj)=Z0*conj(Z0)/(w(jj)*mu);
%Aphase=180/pi*atan(imag(Z0)/real(Z0));
Aphase(jj)=180/pi*angle(Z0)-90;

end

error1=Arho-model_1_Grho';
sq1=error1.^2;
avg1=mean(sq1);
rms1=avg1.^0.5;

subplot (2,1,1)
loglog(1./f,Arho,"k",1./f,model_1_Grho,"r");
legend('Theoretical','Measured');
xlabel('Time Period (in sec)');
ylabel('Appearent Resistivity (in ohm-m)');
grid on;
subplot  (2,1,2)
semilogx(1./f,Aphase,"k",1./f,model_1_Gphase,"r");
legend('Theoretical','Measured');
xlabel('Time Period (in sec)');
ylabel('Appearent Phase (in degrees)');
grid on;
