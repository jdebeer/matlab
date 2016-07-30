  function [t, y] = am4(f, tspan, y0, N) 
% function [t, y] = am4(f, tspan, y0, N)
% Implicit 4th order Adams-Moulton method for solving ODEs 
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
    r       = zeros(N + 1, m);  %auxillary vector 
    t       = linspace(initial, final, N + 1)';
    y(1, :) = y0'; 
% Initialization: 
    options = optimset('Display', 'off', 'TolX', 1.0e-09, 'TolFun', 1.0e-09); 
     
    
    [ti, yi]  = rk4(f, [t(1), t(3)], y0, 2); 
    j         = 1:3;
    y(j, :)   = yi'; 
     for k = 1:3; r(k, :)   = f(t(k), y(k, :));  end
       for k = 3:N
        %  (4th Order Adams-Moulton) 
         r(k, :) = f(t(k), y(k, :)) ;
         tt      = t(k + 1); 
         yk      =  y(k, :)';
         g       = @(xx) (xx - yk  ...
                 -h*(9.0*f(tt,xx)+19.0*r(k,:)-5.0*r(k-1,:)+r(k-2,:))/24.0);  
           if m == 1 
             y(k + 1, :) = fzero(g,  yk, options); 
           else 
             y(k + 1, :) = fsolve(g, yk, options); 
           end       
       end 