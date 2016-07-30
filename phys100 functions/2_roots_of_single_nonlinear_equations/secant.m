  function [x, k]  = secant(f, range, tol) 
% function [x, k]  = secant(f, range, tol)
% INPUT: 
%          f         = function 
%        range       [a, b]    [must bracket the "root"]
%        tol         OPTIONAL 
% OUTPUT: 
%          x         = root 
%          k         = number of iterations 
%  Numerical Recipes in Fortran, 2nd Ed. 
%   Press, W H, Teukolsky, S A, Vetterling, W T, Flannery, B P [1992], p. 350
 a   = range(1); b = range(2);
 if nargin < 3; tol = 1.0e3*eps; end
  kmax          = 101;
  fa            = f(a);
  fb            = f(b);
  x             = a; 
   if abs(fa) < abs(fb) % swap fa & fb 
       x        = a; 
       a        = b;
       tmp      = fa;
       fa       = fb; 
       fb       = tmp; 
   else
       x        = b;
  end
  
  for k = 1:kmax
     delta   = (a - x)*fb/(fb - fa); 
     a       = x;
     fa      = fb; 
     x       = x + delta;
     fb      = f(x); 
    % fprintf('k = %3.0d  x = %20.16f\n', k, x); 
     if abs(delta) <= tol; return; end  
  end
 x = Inf;