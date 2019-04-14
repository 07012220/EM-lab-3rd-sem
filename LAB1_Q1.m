clear all
close all
clc

% Variable initialisation
x=0:10:1000;    % profile direction
a= 50;          % half width of rod/sheet
x0=500;         % point in the profile direction directly above center of the sheet
alpha= 60;      % inclination of the shhet
h= 20;          % depth of the center of the sheet
k=50;           % electric dipole density

% Formula
num=((x-x0)-a*cosd(alpha)).^2 + (h-a*sind(alpha)).^2;
deno=((x-x0)+a*cosd(alpha)).^2 + (h+a*sind(alpha)).^2; 
V=k*log(num./deno);

% Plotting
plot(x,V)
title('Fig (1.2) SP anomaly(in mV) along profile direction(x)')
xlabel('Distance')
ylabel('Potential (in mV)')