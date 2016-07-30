  function [t, y] = euler_trapezoid(f, tspan, y0, N) 
% function [t, y] = euler_trapezoid(f, tspan, y0, N)
% Implicit Euler method (2nd order) for solving ODEs 
% INPUT: 
%      f       = name of function 
%      tspan   = [tmin, tmax], range of times 
%      y0      = initial independent value (y0 MUST be mx1 column vector)
%      n       = number of steps 
% OUTPUT: 
%      t       = corresponding t      (nx1 column vector)
%      y       = final values 
    
    initial = tspan(1); 
    final   = tspan(2); 
    h       = (final - initial)/N; 
    m       = length(y0); 
    y       = zeros(N + 1, m); 
    t       = linspace(initial, final, N + 1)';
    y(1, :) = y0'; 
% Initialization: 
    options = optimset('Display', 'off', 'TolX', 1.0e-09, 'TolFun', 1.0e-09); 
      
       for k = 2:N+ 1
	     yk_1    = y(k - 1, :)'; 
	     tt_1    = t(k - 1); 
         tt      = t(k); 
         g       = @(x) (x - yk_1 - 0.5*(f(tt_1, yk_1) + f(tt, x))*h); 
           if m == 1 
             y(k, :) = fzero(g, yk_1, options); 
           else 
             y(k, :) = fsolve(g, yk_1, options); 
           end       
       end 
       
