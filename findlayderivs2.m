%Evaluates the time derivatives for the Findlay model to be used during ode45.

function F = findlayderivs2(t,x)
%x will be a vector holding the nurtient concentration N and the 
%phytoplankton concentration P, .

global N0 k m g a; 

N0 = 10;
k = 0.5;
m = 3;
g = 0.8;
a = 50;
%Defines our parameters global and gives them model values from the
%Findlay 2006 paper.

M = 25; %Defines our M variable local and at constant 25.
N = x(1);
P = x(2);
%Defines our variables

rM = a/M;
%Defines our r(M) function.

dPdt = (N/(k + N))*rM*P - (g*P) - (m/M)*P;
dNdt = -(N/(k + N))*rM*P + (m/M)*(N0 - N);

F = [dNdt;dPdt];
end