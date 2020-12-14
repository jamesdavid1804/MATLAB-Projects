%Produces a plot for solutions u(x,t) at t=0,1,2,4
function plot2()
%Defines mesh-grid and input agruments
x = (-50:50)/5;
t = (0:40)/10;
m = 0;
%Approximates and assigns solutions to u
sol = pdepe(m,@pdefunp2,@pdeicp2,@pdebcp2,x,t);
u = sol(:,:,1);
%Produces plot for solutions at t=0,1,2,4
u0124 = [u(1,:);u(11,:);u(21,:);u(41,:)];
hold off
for i = 1:4
    plot(x,u0124(i,:));
    hold on
end
title('Plot for solution to t = 0, t = 1, t = 2, t = 3, and t = 4')
xlabel('x')
ylabel('u(x,t) (for set t)')
legend('t=0','t=1','t=2','t=4','Location','east','FontSize',12)
    