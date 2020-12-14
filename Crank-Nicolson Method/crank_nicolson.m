function [w] = crank_nicolson(T,M,x,u0,f,x0,x1)
% Solves the heat equation by the crank-nicolson method and returns the 
% result; 
% T - upper time limit
% M - number of steps in time
% x - (pre-calculated) array of grid points in x,
% u0 - (pre-calculated) initial condition evaluated at the grid points
% x0 - boundary condition for x = 0
% x1 - boundary condition for x = 1
% f - function defining non-homogenous function
N=length(x)-1;
if (N+1)~=length(u0)
    error('Dimensions of x and u0 must agree')
end
h=(x(N+1)-x(1))/N; tau=T/M; gamma=tau/h^2;
w=zeros(N+1,M+1);
% grid points
t=(0:M)*tau;
% initial condition
w(:,1)=u0;
% boundary conditions
w(1,:)=x0;
w(N+1,:)=x1;
% solving the tridiagonal system by the double-sweep method
alpha=zeros(1,N);
beta=zeros(1,N);
for m=2:(M+1)
    alpha(1) = 0.0;
    beta(1) = x0;
    for i=2:N
        denom = 2+gamma*(2-alpha(i-1));
        F = gamma*(-w(i+1,m-1)+2*w(i,m-1)-w(i-1,m-1))-2*(w(i,m-1)+tau*f(x(i)));
        alpha(i)=gamma/denom;
        beta(i)=(gamma*beta(i-1)-F)/denom;
    end
    for i=N:(-1):2
        w(i,m)=alpha(i)*w(i+1,m)+beta(i);
    end
end
