%Finds our fixed points using the fsolve function with 5 different intial
%values.

eq = [];%sets up our solution matrix

for i = 1:10
    eq = [eq;fsolve(@findlayderivs,5*rand(1,2))];
end
%Uses intial guesses as two random numbers.

disp(eq);
