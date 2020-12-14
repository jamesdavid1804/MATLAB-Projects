% Simulation of Gillespie SIR CODE1

%initial conditions
init_vals.S = 90;  
init_vals.I = 10;   
init_vals.R = 0;

% define constants
max_dur = 100;
params.bd = 0.01;
params.i = 0.01;
params.di = 0.1;
params.r = 0.1;

%variables for outputs
out.time = []; 
out.S = [];   
out.I = [];   
out.R = [];   

% run the simulation
sim = SIRgillespie (params, init_vals, max_dur);
out.time = [out.time sim.time];
out.S = [out.S sim.S];
out.I = [out.I sim.I];
out.R = [out.R sim.R];

% plot time series outputs

subplot(3, 1, 1);
hold on
xlabel('Time (unit time)');
ylabel('Susceptible Population')
plot (out.time, out.S);
hold off
subplot(3, 1, 2);
hold on
xlabel('Time (unit time)');
ylabel('Infected Population')
plot (out.time, out.I);
hold off
subplot(3, 1, 3);
hold on
xlabel('Time (unit time)');
ylabel('Recovered Population')
plot (out.time, out.R);
hold off