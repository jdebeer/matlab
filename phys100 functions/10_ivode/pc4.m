 function [t, y] = pc4(f, tspan, y0, N) 
%function [t, y] = pc4(f, tspan, y0, N)
% Predictor-corrector 4th order multistep for solving ODEs 
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
%                 size(y)  => [N, m]

    initial  = tspan(1); 
    final    = tspan(2); 
    h        = (final - initial)/N; 
    m        = length(y0); 
    y        = zeros(N + 1, m); 
    t        = linspace(initial, final, N + 1)';
    y(1, :)  = y0'; 

   [ti, yi]  = rk4(f, [t(1); t(4)], y0, 3);
   y(1:4, :) = yi; 
      for k = 1:4
         r(k, :)    = f(t(k), y(k, :));     
      end
       for k = 4:N
	      %  (4th Order Adams-Bashforth)
            r(k, :)      = f(t(k), y(k, :)) ;
            ypk1         = y(k, :) + h*(55.0*r(k, :) -59.0*r(k - 1, :) +37.0*r(k - 2, :)  ... 
                                -9.0*r(k - 3, :))/24.0;   
            tt           = t(k + 1);  
             y(k + 1, :) = y(k, :) + ...
                 h*(9.0*f(tt,ypk1)+19.0*r(k,:)-5.0*r(k-1,:)+r(k-2,:))/24.0;                         
      end 
