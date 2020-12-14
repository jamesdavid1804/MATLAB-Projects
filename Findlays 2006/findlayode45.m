%%Finds our fixed point using the ode45 function starting with a random
%%2-dimensional vector.

ystart = 5*rand(1,2);
%Defines our 2-dimensional randomly generated vector.

[t,x] = ode45(@findlayderivs2,0:200,ystart);
%Solves our ODE's.

N = x(200,1);
P = x(200,2);

solutionText = ['The solutions are N = ',num2str(N),' and P = ',num2str(P),'.'];
disp(solutionText);
%displays our solutions.

fcheck = findlayderivs([N ; P]) % Checks our solution is true.
