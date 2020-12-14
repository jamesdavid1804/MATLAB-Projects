%Produces surface plot for the solution u(x,t)
function plot1()
%Defines mesh-grid and input agruments
x = (-50:50)/5;
t = (0:40)/10;
m = 0;
%Approximates and assigns solutions to u
sol = pdepe(m,@pdefunp2,@pdeicp2,@pdebcp2,x,t);
u = sol(:,:,1);
%Produces surface plot
hold off
surf(x,t,u);
xlabel('x'); ylabel('t'); zlabel('u(x,t)');
title('Surface plot for u(x,t).');