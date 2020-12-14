%Evaluates the time derivatives for the Findlay model when h(t) is a
%defined function of t.

function F = findlayderivs3(t,x)
%x will be a vector holding the nurtient concentration N and the 
%phytoplankton concentration P 

global N0 k m g a min; 

N0 = 10;
k = 0.5;
m = 3;
g = 0.8;
a = 50;
%Defines our parameters global and gives them model values from the
%Findlay 2006 paper.

N = x(1);
P = x(2);
M = 25 + (25 - min)*sin(2*pi/365*t);
%Defines our variables

h = ((2*pi*(25 - min))/365)*cos(2*pi/365*t); %Our forcing element.
rM = a/M;
%Defines our h(t) and r(M) functions.

dPdt = (N/(k + N))*rM*P - (g*P) - ((m+h)/M)*P;
dNdt = -(N/(k + N))*rM*P + ((m+h)/M)*(N0 - N);

F = [dNdt; dPdt];
end