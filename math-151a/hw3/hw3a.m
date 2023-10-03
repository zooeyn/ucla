fstring = 'x^2 - 3';      % target function 
dfstring = '2.0*x';       % target functions derivative

x0  = 5;               % initial guess
eps = 1.0e-12;             % stopping tolerance
format long;              % print out in long format
format compact;           % suppress line feeds

xn  = x0;

eval(['x = xn;',fstring,';']);     % evaluate f  at xn
fn = ans; 
eval(['x = xn;',dfstring,';']);    % evaluate f' at xn
dfn = ans; 

while(abs(fn) > eps)      
   xn  = xn - fn/dfn;      % Newton iteration
   err = abs(xn - sqrt(3.0));
   sprintf(['Error is %-15.10f'],err) 
   eval(['x = xn;',fstring,';']);     % evaluate the f  at xn
   fn = ans; 
   eval(['x = xn;',dfstring,';']);    % evaluate the f' at xn
   dfn = ans; 
end

%
% Print out final results
%
rootErr = abs(xn - sqrt(3.0));
sprintf(['Approximate root of  x^2 - 2.0 is %-15.10f \n'],xn) 
sprintf(['Error in    root of  x^2 - 2.0 is %-15.10e \n'],rootErr) 
