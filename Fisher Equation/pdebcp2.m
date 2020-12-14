%Defines and computes the components for the upper and lower boundary conditions
function [pl,ql,pr,qr] = pdebcp2(xl,ul,xr,ur,t)
%Lower boundary condition
pl = ul - 0.3 - 0.19*sin((pi*t)/2);
ql = 0;
%Upper boundary coindition
pr = 0;
qr = 1/0.33;