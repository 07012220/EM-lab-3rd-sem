clc
clear all
close all
x=0:100:800;
z=0:100:800;
%current_density=j;
[X,Y] = meshgrid(x,z);
j=zeros(length(z),length(x));
% j(20*50+15)=0.0025;
% j(20*51+15)=0.0025;
figure
pcolor(X,-Y,j)