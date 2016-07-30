  function [t, y] = rk2(f, tspan, y0, n) 
% function [t, y] = rk2(f, tspan, y0, n) 
% 2nd-order Runge Kutta
% System of ODEs identified via length of y0
% INPUT: 
%         f       = name of function 
%                   f MUST be a 'string' OR function handle  
%         tspan   = [tmin, tmax], range of times 
%         y0      = initial independent value 
%                  y0 MUST be a column vector
%                  size(y0) => [m, 1]
%         n       = number of steps 
% OUTPUT: 
%         t       = corresponding t 
%                 size(t)  => [n, 1]
%         y       = final values 
%                 size(y)  => [n, m]

    initial = tspan(1);  final   = tspan(2);    
    m       = length(y0);
    y       = zeros(n, m); 
    t       = linspace(initial, final, n)'; 
    h       = t(2) - t(1); 
    y(1, :) = y0';  

    for i = 1:n - 1 
	    k1          = h*f( t(i), y(i, :));
	    k2          = h*f( t(i) + h, y(i, :)' + k1);
        y(i + 1, :) = y(i, :) + ((k1 + k2))'./2; 
        k2          = h*f(t(i) + h, y(i, :)' + k1);
        y(i + 1, :) = y(i, :) + ((k1 + k2))'./2; 
    end 