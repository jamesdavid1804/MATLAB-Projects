%Defines and computes the initilal condition for a given x
function u0 = pdeicp2(x)
if abs(x) > 1.2
    u0 = 0.3;
else
    u0 = 0.8;
end