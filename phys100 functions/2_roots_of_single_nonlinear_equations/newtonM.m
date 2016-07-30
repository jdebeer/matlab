 function [xm, k] = newtonM(f, fprime, x, tol)
%function [xm, k] = newtonM(f, fprime, x, tol)
%INPUT:
%        f       = f(x)    function  [defined via function handle]
%        fprime  = df/dx   function  [defined via function handle]
%        x       = estimate/guess for the root
%        tol              OPTIONAL 
%OUTPUT 
%        xm       =  ALL approximations for the value of the root
%        k        =  number of iterations 
% From Numerical Computing with MATLAB, by C. B. Moler
%     [SIAM: Philadelphia], p. 119

 if nargin < 4; tol = 1.0e3*eps; end
 k    = 0;  
 kmax = 1001; 
      if x ~= 0.0
         % Solving Nonlinear Equations with Newton's Method, 
         % Kelley, C. T. 2003, (SIAM: Philadelphia), p. 23
         xprev = 0.99*x;
      else
         xprev = 0.001;
      end
      while abs( x - xprev) > tol 
        xprev = x;
        x     = xprev - f(x)/fprime(x);
        k     = k + 1;
        xm(k) = x; 
        % fprintf('k =  %2.0d  x = %+20.14e \n', k, x);
        if k > kmax; x = Inf; break; end
      end
      
   