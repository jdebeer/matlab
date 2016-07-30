function example_taylor_2nd

y0      = 1; 
initial = 0.0;
final   = 1.0;
N       = 25;

[t, y] = taylor_2nd(@f, @ft, [initial, final], y0, N);
subplot(1, 2,1),plot(t, y, 'r', 'LineWidth', 2); 
title('Taylor Series 2^{nd} Order', 'FontSize', 14);
xlabel('t'); ylabel('y(t)');
subplot(1, 2, 2), plot(t, abs(y - exact(t)),  'LineWidth', 2);
xlabel('t'); ylabel('|y(t) - exact(t)|');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dy_dt = f(t, y)
    dy_dt = -2*t*y^2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function r = ft(t, y)
  %y'' = ft + f*fy 
  r   = -2*y^2 -2*t*y^2*(-4*t*y);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function r = exact(t)
   r = 1./(1 + t.^2); 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
    function [t, y] = taylor_2nd(f, ft, tspan, y0, N) 
% function [t, y] = taylor_2nd(f, ft, tspan, y0, N)
% 2nd order Taylor method for solving ODEs 
% INPUT: 
%         f       = name of function ['string'] 
%         ft      = name of y'' ['string'] 
%         tspan   = [initial, final]
%         n       = number of steps 
%         y0      = initial independent value \
%         N       = numner of steps
% OUTPUT: 
%         y       = final values 
%         t       = corresponding dependent values 
%  Heath p. 284

    final   = tspan(2);
    initial = tspan(1);
    h       = (final - initial)/(N - 1);    
    y       = zeros(N, 1); 
    t       = linspace(initial, final, N)'; 
    y(1)    = y0; 

      for k = 2:N 
        y(k) = y(k - 1) + h*f(t(k - 1), y(k - 1))+ 0.5*h*h*ft(t(k-1), y(k-1)); 
      end
    end
