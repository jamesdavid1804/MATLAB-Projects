%Question 1 - a function that plots the surface for u(x,t) solved by the 
%crank_nicolson method for 0 < t < 0.3 for set inputs of T, M, x, u0, f, x0, and x1.
function plot_1
%sets crank_nicolson input values and evaluates
T = 0.3; M = 50; x = (0:25)/25; u0 = -1.8*sin((3*pi*x)/2)-0.3;
f = @(x)27*sin(2*pi*x); x0 = -0.3; x1 = 1.5;
w = crank_nicolson(T,M,x,u0,f,x0,x1);
%prepares for the surface plot and then plots
w=w';
x = (0:25)/25;
t = (0:50)/(1/6*10^3);
surf(x,t,w);
xlabel('x'); ylabel('t'); zlabel('u(x,t)');
title('Surface plot for u(x,t).');

