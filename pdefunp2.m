%Defines and evaluates the components of the problem PDE
function [c,f,s] = pdefunp2(x,t,u,DuDx)
c = 1;
f = 0.33*DuDx;
s = 1.8*(1-u)*u;