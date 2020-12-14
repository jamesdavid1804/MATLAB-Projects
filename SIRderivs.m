%Evaluates the determinstic ODEs for our epidemic system.
function F = SIRderivs (t, initial)

global a b c d;
a = 0.01;
b = 0.01;
c = 0.1;
d = 0.1;
%Sets our parameter rates as global and defines them.

S = initial(1);
I = initial(2);
R = initial(3);
%Defines our initial populations values.

dSdt = a*(I + R) - b*(S * I);
dIdt = b*(S * I) - (a + c + d)*I;
dRdt = d*I - a*R;

F = [dSdt;dIdt;dRdt];
end

