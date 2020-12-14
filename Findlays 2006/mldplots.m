%Evaluates M at time t and produces a plot over a 365 day period.

global min; %Allows access to our min value.

t = 0:1:365;%Sets up our time scale.

min = 10;
M = 25 + (25 - min)*sin(2*pi/365*t);
%Redefines and calculates our M(t) function for min = 10.
subplot(1,2,1)
hold on
axis([0 365 5 50])
title('Minimum M Value = 10')
xlabel('t')
ylabel('M(t)')
plot(t,M);
%Produces our subplot for values M against time.

min = 20;
M = 25 + (25 - min)*sin(2*pi/365*t);
%Redefines and calculates our M(t) function for min = 20.
subplot(1,2,2)
hold on
axis([0 365 5 50])
title('Minimum M Value = 20')
xlabel('t')
ylabel('M(t)')
plot(t,M);
%Produces our subplot for values M against time.