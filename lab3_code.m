dataset=csvread('data_RM.csv');
a=dataset(:,1);
V=dataset(:,2);
I=dataset(:,3);

rho=2*pi.*a.*V./I;
x1=3*a/2;

cumrho=cumsum(rho);% cumsum is like -> k(i)=k(i-1)+q;
subplot(1,2,1);
loglog(x1,cumrho);
xlabel('3a/2 (in cm)');
ylabel('cumulative resistivity (in ohm m)');
title('variation of rho with 3a/2');
hold on;
scatter(x1,cumrho);
set(gca,'xscale','log','yscale','log')
hold off;
grid on;
% xlabel('3a/2 (in cm)');
% ylabel('cumulative resistivity (in ohm m)');
% title('variation of rho with 3a/2');

slope=(diff(cumrho)./diff(x1));

subplot(1,2,2);
loglog(slope);
xlabel('line no. bw point i & i+1');
ylabel('slope of the line');
title('variation of slope of lines');
