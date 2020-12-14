%Stochastically triggers our system and plots the results from an initial
%randomly generated point.

global min; %Allows access to our min value.

min = 5;
timestep = 0.001;
tmax = 365;
timelength = tmax/timestep; % the number of time steps we will need

initial = rand(1,2);  %Sets up our initial value.
timevec = 1:timelength;  %Vector for time
xmat = zeros(2,timelength);     % matrix for concentrations at corresponding times for h(t) = 0.
xmat(:,1)=initial;
xmat2 = zeros(2,timelength);     % matrix for concentrations at corresponding times for forced system.
xmat2(:,1)=initial;

epsilon = 0.01; %Set our first epsilon value
for i=2:timelength
    xmat(:,i) = xmat(:,i-1) + timestep.*findlayderivs2(1,xmat(:,i-1));
    xmat(2,i) = xmat(2,i) + epsilon*xmat(2,i)*sqrt(timestep)*randn;
end

for i=2:timelength
    revt = i*timestep; %sets i up to be used in forced system
    xmat2(:,i) = xmat2(:,i-1) + timestep.*findlayderivs3(revt - 1,xmat2(:,i-1)); % the Euler step
    xmat2(2,i) = xmat2(2,i) + epsilon*xmat2(2,i)*sqrt(timestep)*randn; % Maruyama step
end

[tcheck,xcheck]=ode45(@findlayderivs2,0:timestep:tmax,initial);  % Using ode45 to get mean plot
[tcheck2,xcheck2]=ode45(@findlayderivs3,0:timestep:tmax,initial);

subplot(2,2,1)
hold on
axis([0 365 0 2])
title('h(t) = 0')
xlabel('Time (days)')
ylabel('Concentrations')
plot(double(timevec)*timestep,xmat(1,:),'b');
plot(double(timevec)*timestep,xmat(2,:),'r');
plot(tcheck,xcheck,'k');
legend('N (noise)','P (noise)','N,P (Mean)');

subplot(2,2,2)
hold on
axis([0 365 0 6])
title('Forced System')
xlabel('Time (days)')
ylabel('Concentrations')
plot(double(timevec)*timestep,xmat2(1,:),'b');
plot(double(timevec)*timestep,xmat2(2,:),'r');
plot(tcheck2,xcheck2,'k');
legend('N (noise)','P (noise)','N,P (Mean)');
%Produces our subplots for forced and unforced systems at e=0.01

epsilon = 0.1; % Redefines our epsilon value.

for i=2:timelength
    xmat(:,i) = xmat(:,i-1) + timestep.*findlayderivs2(1,xmat(:,i-1));  % the Euler step
    xmat(2,i) = xmat(2,i) + epsilon*xmat(2,i)*sqrt(timestep)*randn;  % Maruyama step
end

for i=2:timelength
    revt = i*timestep; %sets i up to be used in forced system
    xmat2(:,i) = xmat2(:,i-1) + timestep.*findlayderivs3(revt - 1,xmat2(:,i-1));
    xmat2(2,i) = xmat2(2,i) + epsilon*xmat2(2,i)*sqrt(timestep)*randn;
end

[tcheck,xcheck]=ode45(@findlayderivs2,0:timestep:tmax,initial);  % Using ode45 to check
[tcheck2,xcheck2]=ode45(@findlayderivs3,0:timestep:tmax,initial);

subplot(2,2,3)
hold on
axis([0 365 0 2])
title('h(t) = 0')
xlabel('Time (days)')
ylabel('Concentrations')
plot(double(timevec)*timestep,xmat(1,:),'b');
plot(double(timevec)*timestep,xmat(2,:),'r');
plot(tcheck,xcheck,'k');
legend('N (noise)','P (noise)','N,P (Mean)');

subplot(2,2,4)
hold on
axis([0 365 0 6])
title('Forced System')
xlabel('Time (days)')
ylabel('Concentrations')
plot(double(timevec)*timestep,xmat2(1,:),'b');
plot(double(timevec)*timestep,xmat2(2,:),'r');
plot(tcheck2,xcheck2,'k')
legend('N (noise)','P (noise)','N,P (Mean)');
%Produces our subplots for forced and unforced systems at e=0.1