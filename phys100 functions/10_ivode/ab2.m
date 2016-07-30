 function [t, y] = ab2(f, tspan, y0, N) 
%function [t, y] = ab2(f, tspan, y0, N)
% Second order multistep for solving ODEs 
% System of ODEs identified via length of y0
% INPUT: 
%         f       = name of function 
%                   f MUST be a 'string' OR function handle  
%         tspan   = [tmin, tmax], range of times 
%         y0      = initial independent value 
%                  y0 MUST be a column vector
%                  size(y0) => [m, 1]
%         N       = number of steps 
% OUTPUT: 
%         t       = corresponding t 
%                 size(t)  => [N, 1]
%         y       = final values 
%                 size(y)  => [n, m]

    initial = tspan(1); 
    final   = tspan(2); 
    h       = (final - initial)/N; 
    m       = length(y0); 
    y       = zeros(N + 1, m); 
    t       = linspace(initial, final, N + 1)';
    y(1, :) = y0'; 
% Initialization: 
% 2nd order multistep => requires y(1:2)  =>  Employs RK4

   [ti, yi]  = rk4(f, [t(1); t(2)], y0, 1);
   y(1:2, :) = yi; 
   
       for k = 1:2 
         r(k, :)    = f(t(k), y(k, :));     
       end
       
       for k = 2:N
	      %  2nd-Order Adams-Bashforth method 
            r(k, :)     = f(t(k), y(k, :)); 
            y(k + 1, :) = y(k, :) + 0.5*h*(3.0*r(k, :) - r(k - 1, :));          
       end 
