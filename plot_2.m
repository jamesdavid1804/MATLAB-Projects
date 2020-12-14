%Question 2 - a function that plots u(x,t) solved by the crank_nicolson method 
%for t = 0.0, 0.1, and 0.3 for set inputs of T, M, x, u0, f, x0, and x1.
function plot_2
%sets crank_nicolson input values and evaluates
T = 0.3; M = 50; x = (0:25)/25; u0 = -1.8*sin((3*pi*x)/2)-0.3;
f = @(x)27*sin(2*pi*x); x0 = -0.3; x1 = 1.5;
w = crank_nicolson(T,M,x,u0,f,x0,x1);
%caluclates for set t
u_0 = w(:,1);
u_01= w(:,11);
u_03= w(:,31);
%set grid for plot
t = (0:25)/25;

%plots the three solutions on one graph
plot(t,u_0)
hold on
plot(t,u_01)
plot(t,u_03)
title('Plot for solution to t = 0, t = 0.1, and t = 0.3')
xlabel('x')
ylabel('u(x,t) (for set t)')
legend('t=0','t=0.1','t=0.3','Location','southeast','FontSize',12)
hold off
