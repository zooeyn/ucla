%                       newtonRoot.m
%
% A Matlab script that implements Newton's method for 
% finding the roots of the non-linear equation x^2 - 2.0
%
% This is not a robust code - there is no code that 
% terminates the iteration if too many iterates are taken. 
%
fstring = 'x^2 - 3';      % target function 
dfstring = '2.0*x';       % target functions derivative

x0  = 1.25;               % initial guess
eps = 1.0e-4;             % stopping tolerance
format long;              % print out in long format
format compact;           % suppress line feeds

xn  = x0;

eval(['x = xn;',fstring,';']);     % evaluate f  at xn
fn = ans; 
eval(['x = xn;',dfstring,';']);    % evaluate f' at xn
dfn = ans; 

while(abs(fn) > eps)      
   xn  = xn - fn/dfn;      % Newton iteration
   
   sprintf(['Approximate root is %-15.10f'],xn) 
   
   eval(['x = xn;',fstring,';']);     % evaluate the f  at xn
   fn = ans; 
   eval(['x = xn;',dfstring,';']);    % evaluate the f' at xn
   dfn = ans; 
end

%
% Print out final results
%
rootErr = abs(xn - sqrt(2.0));
sprintf(['Approximate root of  x^2 - 2.0 is %-15.10f \n'],xn) 

sprintf(['Error in    root of  x^2 - 2.0 is %-15.10e \n'],rootErr) 
