  function  [x, fv, k] = newton_sys(fs, Js, x0, tol)
% function  [x, fv, k] = newton_sys(fs, Js, x0, tol)
% INPUT: 
%          fs        = system of nonlinear equations 
%          Js        = Jacobian of the system of nonlinear equations
%          x0        = initial guess
%          tol       = absolute accuracy of fit 
% OUTPUT: 
%          x         = root 
%          fv        = fs(root) 
%          k         = number of iterations 

% Numerical Recipes in Fortran: The Art of Scientific Computing, 2nd Ed.
% Press, W H, Teukolsky, S A, Vetterling, W T, & Flannery, B p, (1992), p. 374
    x        = x0;   fv = nan(size(x0));  % dummy fs value
    iter_max = 50;
      for k = 1:iter_max 
        f      = fs(x); 
        J      = Js(x); 
        err    = norm(f, 2);
        if err <= tol; fv = f; return; end 
        s      = linsolve(-J, f); % Solve via intrinsic LU decomposition 
        x      = x + s; 
      end 
 x = nan(size(x0)); 
 disp('newton_sys.m: Not converged');