  function [x, k] = brentK(f, range, tol)
% function [x, k] = brentK(f, range, tol)
% brent algorithm   
%INPUT:
%        f           function  [defined via function handle]
%        range       [a, b]    [must bracket the "root"]
%        tol          OPTIONAL 
% Rearrange brent by JCH 
% Numerical Methods in Engineering MATLAB by J. Kiusalaas 
%     [Cambridge University Press: Cambridge, UK], p. 151
%OUTPUT:
%        x       = approximation for the value of the root
%        k       =  number of iterations 

 if nargin < 3; tol = 1.0e2*eps; end
  
 a  = range(1);   b  = range(2);
 x1 = a;          x2 = b;
 y1 = f(x1);      y2 = f(x2);
 if y1 == 0.0; x = x1; return; end  % x = a since f(a) = 0
 if y2 == 0.0; x = x2; return; end  % x = b since f(b) = - 
 
   kmax = 150;               % maximum number of iterations  
     if sign(y1) == sign(y2)
       fprintf('brentK.m: range does not bracket root\n');
       x = Inf; 
       return; 
     end
 x3 = 0.5*(a + b);  
   for k = 1:kmax 
      y3          = f(x3); 
      if abs(y3) < tol; x = x3; return; end 
      % Tighten bracket [a, b] on root 
        if y1*y3 < 0.0 
            b = x3;
        else 
            a = x3;
        end
        if (b - a) < tol*max(abs(b), 1.0); 
            x = (a + b)/2.0; 
            return; 
        end
     % Try quadratic interpolation 
     den = (y2 - y1)*(y3 - y1)*(y2 - y3);
     num = x3*(y1 - y2)*(y2 - y3 + y1) + y2*x1*(y2 - y3) + y1*x2*(y3 - y1); 
         % if den == 0 push x out of bracket 
         if den == 0.0
           dx = b - a;
         else
           dx = y3*(num/den); % eq. 4.2 Kiusalaas
         end
     x   = x3 + dx; 
        % quadratic interpolation goes outside bracket, use bisection  
        if (b - x)*(x - a) < 0.0 
          dx = 0.5*(b - a); 
          x  = dx + a; 
        end
     % Require that x1 < x3 < x2
        if x < x3 
          x2 = x3; y2 = y3;
        else
          x1 = x3; y1 = y3;
        end
     x3 = x;
    % fprintf('k =  %2.0d  x = %16.14f \n', k, x);
   end
x = NaN; 