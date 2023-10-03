%
%     Script diffapp.m : a script for investigating the accuracy
%     of a centered difference approximation of a derivative. 
%

 
% Specifying target function and it's derivative using @ notation 

f        = @(x)exp(x);
df       = @(x)exp(x);

N = 20;     % number of refinements, you can choose other appropriate numbers
p = 1.0;    % evaluation point

% Compute centered difference approximations to
% the derivative of f at x

diff             = zeros(1,N); % vector for difference approximations with h
diff_onehalf     = zeros(1,N); % vector for difference approxmations with h/2
diffError        = zeros(1,N); % vector for approximation error
diffError_onehalf= zeros(1,N); % vector for approximation error with h/2

h = 1.0;            % initial step size h
h_onehalf = 0.5;    % initial step size h/2

for(i = 1:N)
   fxph = f(p+h);
   fxmh = f(p-h);
   fxph_onehalf = f(p+h_onehalf);
   fxmh_onehalf =  f(p-h_onehalf);
      
   diff(i) = (fxph - fxmh)/(2.0*h); % centered difference approximaiton
   diff_onehalf(i) = (fxph_onehalf - fxmh_onehalf)/(2.0*h_onehalf); % centered difference approximaiton
   h  = h/2.0;
   h_onehalf = h_onehalf/2.0;
end
%
% 
for(i = 1:N)
   dfp = df(p);
   diffError(i) = abs(diff(i) - dfp);
   diffError_onehalf(i) = abs(diff_onehalf(i) - dfp);
end

%%%%%%%%% WRITE CODE TO CALCULATE RATE OF CONVERGENCE


%
% Print out the error. 
% The fs = [fs, ... ] construction creates one long string variable 
% fs that has all of the output contained in it. 
% ([ ...] is the string concatenation operator.)
% After the loop, fs is printed to display the results. 
% This construction avoids printing out extraneous carriage returns and
% lines with "ans =" in them. 
%


h = 1.0;
fs = ['     h                     Error    ',sprintf('\n')];
for(i = 1:N)
   fs =[fs,sprintf('%-15.10e       %-15.10e \n',h,diffError_onehalf(i))];
   h = h/2.0;
end
fs   % display the results


%%%%%%%%% WRITE CODE TO CALCULATE RICHARDSON EXTRAPOLATION APPROXIMATION OF 
%%%%%%%%% f'(p) USING DIFF AND DIFF_ONEHALF

