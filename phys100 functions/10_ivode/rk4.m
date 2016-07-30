  function [t, y] = rk4(f, tspan, y0, N)
% function [t, y] = rk4(f, tspan, y0, N)
% Classic 4th order RK for solving a vector of ODEs 
% INPUT: 
%         f       = function handle 
%         tspan   = [initial, final] 
%         y0      = initial independent value 
%         N       = number of steps 
% OUTPUT: 
%         y(t, :) = final values 
%         t       = corresponding dependent values 

    initial = tspan(1); 
    final   = tspan(2); 
    h       = (final - initial)/N; 
    m       = length(y0); 
    y       = zeros(N + 1, m); 
    t       = linspace(initial, final, N + 1)';
    y(1, :) = y0'; 

       for k = 2:N + 1
	     k1      = h*f( t(k - 1), y(k - 1, :));
	     k2      = h*f( t(k - 1) + h./2.0, y(k - 1, :) + k1'./2.0);
	     k3      = h*f( t(k - 1) + h./2.0, y(k - 1, :) + k2'./2.0);
	     k4      = h*f( t(k - 1) + h,      y(k - 1, :) + k3');
         y(k, :) = y(k - 1, :) + (k1' + 2.0.*k2' + 2.0.*k3' + k4')./6.0; 
       end 
