clear all
close all
clc

% Variable initialisation
%x=0:10:1000; % profile direction
%a= 10:10:50; % half width of rod/sheet
%x0=300:100:700; % point in the profile direction directly above center of the sheet
%alpha=30:15:90; % inclination of the shhet
%k= 30:10:70; % depth of the center of the sheet
%h=50:10:90; % electric dipole density

x=0:1000; % profile direction
a= 50; % half width of rod/sheet
x0=500; % point in the profile direction directly above center of the sheet
alpha= 60; % inclination of the shhet
h= 20; % depth of the center of the sheet
k=50; % electric dipole density

% Formula
num=((x-x0)-a*cosd(alpha)).^2 + (h-a*sind(alpha)).^2;
deno=((x-x0)+a*cosd(alpha)).^2 + (h+a*sind(alpha)).^2;
V=k*log(num./deno);

% Plotting
plot(V)
title('Fig (1.2) SP anomaly(V) along profile direction(x)')
xlabel('Distance')
ylabel('Potential')
