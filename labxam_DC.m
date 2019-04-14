clear all
close all
clc

a=[-0.980685 -.771995 -.563305 -.354615 ...
   -.145925  .062765  .271455  .480145  .688835 ...
   0.897525 1.106215 1.314905 1.523595 1.732285 ...         %inputting abscissa of  filter coefficient
   1.940975 2.149665 2.358355 2.567045 2.775735];                 
f=[ 0.00097112 -0.00102152  0.00906965  0.01404316 ...
    0.09012     0.30171582  0.99627084  1.3690832  -2.99681171 ...
    1.65463068 -0.59399277  0.22329813 -0.10119309  0.05186135 ... %inputting filter coefficients
    -0.02748647  0.01384932 -0.00599074  0.00190463 -0.0003216 ];


dataset=csvread('data_dc.csv');
x1=dataset(:,1);
sp1=dataset(:,10);
% sp2=dataset(:,3);
% sp3=dataset(:,4);
% sp4=dataset(:,5);

%loglog(x1,sp1); % H type curved
s=x1;  %  (half of current electrode seprn)
ns=29;
rhoa=zeros([1 29]);                        %vector to store apparent resistivity for different s

num_layers=4;
rhot=[248,20,300,46.2];                 
h=[3,10,30];                         

lambda=zeros([1 19]);                      %
t=zeros([1 3]);                            %vector to store Resistivity transform for each value of s
sumn=0;
for i=1:length(s)                          % loop for calculation of resistivity for different s
  sumn=0;
  t=zeros([1 num_layers]);
  for j=1:length(a)                        %loop for summing values from filter coefficints
    lambda(j)=10.^(a(j)-log10(s(i)));
    t(num_layers)=rhot(num_layers);
    for k=1:num_layers-1                              %loop for determining T1 for each s
      num=t(num_layers+1-k)+(rhot(num_layers-k)*tanh(lambda(j)*h(num_layers-k)));
      den=1+(t(num_layers+1-k)*tanh(lambda(j)*h(num_layers-k))/rhot(num_layers-k));
      t(num_layers-k)=num/den;   
    end
    sumn=sumn+(f(j)*t(1));
  end
  rhoa(i)=sumn;
end


error1=rhoa'-sp1;
sq1=error1.^2;
avg1=mean(sq1);
rms1=avg1.^0.5;


loglog(x1,sp1,"r",s,rhoa,"*k");   %plotting the rho vs s curve in log-log scale
legend('measured','theoretical');
title('Variation of apparent resistivity with changing electrode separation');
xlabel('electrode seperation (in m)');
ylabel('resistivity (in ohm.m)');
grid on
ylim([1, 300]);                            %limiting the extent of y-scale