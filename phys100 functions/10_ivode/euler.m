  function [t, y] = euler(f, tspan, y0, N) 
% function [t, y] = euler(f, tspan, y0, N)
% Euler method (1st order) for solving system of 1st Order ODEs 
% Soves systems of ODEs or single ODE  
% System of ODEs identified via length of y0
% INPUT: 
%         f       = name of function of form (t, y) 
%         tspan   = [tmin, tmax], range of times 
%         y0      = initial independent value 
%                  y0 MUST be a column vector
%                  size(y0) => [m, 1]
%        N       = number of steps 
% OUTPUT: 
%         t       = corresponding t 
%                 size(t)  => [N, 1]
%         y       = final values 
%                 size(y)  => [N, m]
    initial = tspan(1); 
    final   = tspan(2); 
    h       = (final - initial)/N; 
    m       = length(y0); 
    y       = zeros(N + 1, m); 
    t       = linspace(initial, final, N + 1)';
    y(1, :) = y0'; 

       for k = 2:N + 1
         y(k, :) = y(k - 1, :) + h*f(t(k - 1), y(k - 1, :))'; 
       end 
        

    
