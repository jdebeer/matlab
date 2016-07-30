  function [t, y] = backwards_euler(f, tspan, y0,N) 
% function [t, y] = backwards_euler(f, tspan, y0,N)
% Implicit Euler method (1st order) for solving ODEs 
% INPUT: 
%      f       = name of function 
%      tspan   = [tmin, tmax], range of times 
%      y0      = initial independent value (y0 MUST be mx1 column vector)
%     N       = number of steps 
% OUTPUT: 
%      t       = corresponding t      (nx1 column vector)
%      y       = final values 
% Heath, p. 280
    
    initial = tspan(1); 
    final   = tspan(2); 
    h       = (final - initial)/N;
    m       = length(y0);
    y       = zeros(N + 1, m); 
    t       = linspace(initial, final, N + 1)';
    y(1, :) = y0'; 

    options = optimset('Display', 'off', 'TolX', 1.0e-09, 'TolFun', 1.0e-09); 
       for k = 2:N + 1
	     yk_1  = y(k - 1, :)'; 
         tt    = t(k);   
         g      = @(xx) (xx - yk_1 - f(tt, xx)*h); 
           if m == 1 
             y(k, :) = fzero(g, yk_1, options); 
           else 
             y(k, :) = fsolve(g, yk_1, options);  
           end
       end 

       
        for k = 2:N+ 1
	     yk_1    = y(k - 1, :)'; 
	     tt_1    = t(k - 1); 
         tt      = t(k); 
         g       = @(yy) (yy - yk_1 - (f(tt, yy))*h); 
         yy      = fzero(g, yk_1); 
         y(k, :) = yy; 
       end 
       

    
