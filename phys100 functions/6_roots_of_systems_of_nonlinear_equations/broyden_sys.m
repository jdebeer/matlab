  function  [x, fv, k] = broyden_sys(fs, x0, tol) 
% function  [x, fv, k] = broyden_sys(fs, x0, tol)  
% INPUT: 
%          fs        = system of nonlinear equations 
%          x0        = initial guess
%          tol       = absolute accuracy of fit 
% OUTPUT
%          x         = root 
%          fv        = fs(root) 
%          k         = number of iterations 
% Numerical Methods Using MATLAB, 2nd Ed. G Linbdfield & J Penny
% 2000, (Prentice Hall: Saddle River, NJ).  [p. 153]
  fv = nan(size(x0));  % dummy fs value
  iter = 100; 
  n    = length(x0); 
  % NOTE: initial guess for Jacobian is eye(n) 
  J    = eye(n); 
  x    = x0;  
     for k = 1:iter
        fn     = fs(x); 
        pr     = -J*fn;
        x1     = x + pr; 
        fn_old = fn; 
        x      = x1;
        fn     = fs(x);
        % Update Jacobian 
        y      = fn - fn_old; 
        J_old  = J; 
        old_yp = J_old*y - pr; 
        pJ     = pr'*J_old; 
            for i = 1:n 
               for j = 1:n; M(i, j) = old_yp(i)*pJ(j); end
           end 
        J      = J_old - M./(pr'*J_old*y); 
        if norm(abs(fn)) < tol;  fv = fn; return; end
     end  
  x = nan(size(x0));
 disp('Not converged');  
     