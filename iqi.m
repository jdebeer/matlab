  function [x, k] = iqi(f, range, tol)
% function [x, k] = iqi(f, range, tol)
% Inverse Quadratic Interpolation
%INPUT:
%        f           function  [defined via function handle]
%        range       [a, b]    [must bracket the "root"]
%        tol         OPTIONAL 
% Composite of IQI.m for limits/format (Moler) and algebra of 
% actual form of inverse quadratic equation, eq. 4.2 (Kiusalaas)
% 
% Numerical Computing with MATLAB, by C. B. Moler
%     [SIAM: Philadelphia], p. 123
% Numerical Methods in Engineering MATLAB by J. Kiusalaas 
%     [Cambridge University Press: Cambridge, UK], p. 151
%OUTPUT:
%        x       = approximation for the value of the root
%        k       = number of iterations 

 if nargin < 3; tol = 1.0e3*eps; end
 x1 = range(1);      y1 = f(x1);
 x2 = range(2);      y2 = f(x2); 
 x3 = (x1 + x2)/2.0; 
 k  = 0; 
  while (1)
     y3          = f(x3); 
     denominator = (y2 - y1)*(y3 - y1)*(y2 - y3);
     numerator   =        x3*(y1 - y2)*(y2 - y3 + y1) ...
                     + y2*x1*(y2 - y3)                ...
                     + y1*x2*(y3 - y1); 
     x           = x3 +  y3*(numerator/denominator); % eq. 4.2 Kiusalaas
     if abs(x - x3) < tol; break; end 
     % Require that x1 < x3 < x2
        if x < x3 
          x2 = x3; y2 = y3;
        else
          x1 = x3; y1 = y3;
        end
     x3 = x;
     k           = k + 1;
     %fprintf('k =  %2.0d  x = %16.14f \n', k, x);
   end
