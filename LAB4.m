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
s=[1.5 2 3 4 6 8 10 15 20 25 30 40 50 60 80 100 ...        %inputting the electrode separations 
   120 140 160 180 200 250 300 350 400 500 600 800 1000];  %  (half of current electrode seprn)
ns=29;

rhot=[10 50 20 700 350 1000];              %true resistivities of all layer (considering 6 layers)
h=[10 30 40 50 70];                        %thickness of top 5 resistivity layers (considering 6 layers)

rhoa=zeros([1 29]);                        %vector to store apparent resistivity for different s
lambda=zeros([1 19]);                      %
t=zeros([1 6]);                            %vector to store Resistivity transform for each value of s
sumn=0;
for i=1:length(s)                          % loop for calculation of resistivity for different s
  sumn=0;
  t=zeros([1 6]);
  for j=1:length(a)                        %loop for summing values from filter coefficints
    lambda(j)=10.^(a(j)-log10(s(i)));
    t(6)=rhot(6);
    for k=1:5                              %loop for determining T1 for each s
      num=t(7-k)+(rhot(6-k)*tanh(lambda(j)*h(6-k)));
      den=1+(t(7-k)*tanh(lambda(j)*h(6-k))/rhot(6-k));
      t(6-k)=num/den;   
    end
    sumn=sumn+(f(j)*t(1));
  end
  rhoa(i)=sumn;
end

loglog(s,rhoa);                            %plotting the rho vs s curve in log-log scale
title('Variation of apparent resistivity with changing electrode separation');
xlabel('electrode saperation (s) / m');
ylabel('resistivity (rho) / ohm.m');
grid on
ylim([1, 300]);                            %limiting the extent of y-scale
