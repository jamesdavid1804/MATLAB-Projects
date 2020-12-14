%Runs SIRplot 100 times and plots over our deterministic results.


for i=1:100 %Runs and plots 100 Gillespie simulations.
    SIRplot;
end

SIRderivsplot;% Plots our derterminstic system for epidemics.
set([x1 x2 x3],'LineWidth',2);% Makes the line bolder to see interaction.
 