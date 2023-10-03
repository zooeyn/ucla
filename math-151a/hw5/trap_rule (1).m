function I = trap_rule(x_k, N)
% x_k is the upper bound of the integral in the trapezoidal rule
% N is the number of subintervals

h = x_k/N; % step size

% Define integrand
g= @(x)1./sqrt(2.*pi) * exp(-x.^2/2.);


%Initialize I; this is the value that will be returned by the function
I = 0.; 

% implement trapezoidal rule here. 

end