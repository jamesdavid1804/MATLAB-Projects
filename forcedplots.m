%Taking an intial randomly generated starting point will plot 4 sets of
%graphs of our concentration levels and varying values of M(t) over a 365
%day period.

global min; %Allows access to our min value.
t = 0:0.01:365;
ystart = [1.0132,2.7002];
%Sets up our initial value and time scale.

min = 25;
M = 25 + (25 - min)*sin(2*pi/365*t);
%Redefines and calculates our M(t) function for min = 25.
[t,y] = ode45(@findlayderivs3,0:0.01:365,ystart);
subplot(4,2,1)
hold on
axis([0 365 0 5])
title('Concentration Levels')
xlabel('Time (days)')
ylabel('Concentration(mmol N m^{-3})')
plot(t,y)
legend('N','P')

subplot(4,2,2)
hold on
axis([0 365 0 50])
title('Min = 25')
xlabel('Time (days)')
ylabel('Depth(m)')
plot(t,M);
%Produces our subplots for M value and concentration level.

min = 20;
M = 25 + (25 - min)*sin(2*pi/365*t);
%Redefines and calculates our M(t) function for min = 20.
[t,y] = ode45(@findlayderivs3,0:0.01:365,ystart);
subplot(4,2,3)
hold on
axis([0 365 0 5])
xlabel('Time (days)')
ylabel('Concentration(mmol N m^{-3})')
plot(t,y)
legend('N','P')

subplot(4,2,4)
hold on
axis([0 365 0 50])
title('Min = 20')
xlabel('Time (days)')
ylabel('Depth(m)')
plot(t,M);
%Produces our subplots for M value and concentration level.

min = 10;
M = 25 + (25 - min)*sin(2*pi/365*t);
%Redefines and calculates our M(t) function for min = 10.
[t,y] = ode45(@findlayderivs3,0:0.01:365,ystart);
subplot(4,2,5)
hold on
axis([0 365 0 5])
xlabel('Time (days)')
ylabel('Concentration(mmol N m^{-3})')
plot(t,y)
legend('N','P')

subplot(4,2,6)
hold on
axis([0 365 0 50])
title('Min = 10')
xlabel('Time (days)')
ylabel('Depth(m)')
plot(t,M);
%Produces our subplots for M value and concentration level.

min = 5;
M = 25 + (25 - min)*sin(2*pi/365*t);
%Redefines and calculates our M(t) function for min = 5.
[t,y] = ode45(@findlayderivs3,0:0.01:365,ystart);
subplot(4,2,7)
hold on
axis([0 365 0 5])
xlabel('Time (days)')
ylabel('Concentration(mmol N m^{-3})')
plot(t,y)
legend('N','P')

subplot(4,2,8)
hold on
axis([0 365 0 50])
title('Min = 5')
xlabel('Time (days)')
ylabel('Depth(m)')
plot(t,M);
%Produces our subplots for M value and concentration level.