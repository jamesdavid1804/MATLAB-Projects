%Taking our initial population values will plot 3 graphs of our populations
%over a period of 100 (unit time).

initial = [90;10;0];
%Sets up our initial population count.

[t,y] = ode45(@SIRderivs,0:0.01:100,initial);

subplot(3,1,1)
hold on
axis([0 100 0 100])
xlabel('Time (Unit Time)')
ylabel('Susceptible Population')
x1 = plot(t,y(:,1),'k');
hold off

subplot(3,1,2)
hold on
axis([0 100 0 100])
xlabel('Time (Unit Time)')
ylabel('Infected Population')
x2 = plot(t,y(:,2),'k');
hold off

subplot(3,1,3)
hold on
axis([0 100 0 100])
xlabel('Time (Unit Time)')
ylabel('Recovered Population')
x3 = plot(t,y(:,3),'k');
hold off

%Produces our subplots for population against time.