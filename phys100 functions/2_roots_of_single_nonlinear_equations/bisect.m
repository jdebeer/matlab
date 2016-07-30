 function [m, k] = bisect(f, range, tol)
%function [m, k] = bisect(f, range, tol)
% INPUT:
%        f           function  [defined via function handle]
%        range       [a, b]    [must bracket the "root"]
%        tol         OPTIONAL 
% From Numerical Computing with MATLAB, by C. B. Moler
%     [SIAM: Philadelphia], p. 118
% OUTPUT:
%        m           approximation for the value of the root
%        k           number of iterations 

  a   = range(1); b = range(2);
 if nargin < 3; tol = 1.0e3*eps; end
     if f(a)*f(b) > 0.0
       fprintf('bisect: range does not bracket root\n');
       m = Inf; k = NaN; 
       return; 
     end
  kmax = 101;  % maximum number of iterations 
  % Termination criterion: absolute error in root location 
    for k = 1:kmax 
      m = (a + b)/2; 
     %fprintf('k =  %3.0d m = %+22.16e  (%+12.10f %+12.10f) \n', k, m, a, b); 
    if  (abs(a - b) <= tol); return; end
        if sign(f(m)) == sign(f(b))
          b = m;
        else
          a = m;
        end
      k = k + 1;  
    end
  fprintf('bisection: exceeded maximum number of iterations\n');
  m = Inf; 