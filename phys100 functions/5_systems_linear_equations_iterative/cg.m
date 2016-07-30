function [x, error, k, flag, residual, n] = cg(A, x, b, maxit, tol) 
  % Algorithm 38.1 Conjugate Gradient (Trefethen, L N & Bau, D  p. 294
  %   Numerical Linear Algebra  [SIAM; Philadelphia]  (1997) 
  % Ascher, U M & Greif C (2011) p. 184 
  %   A First Course in Numerical Methods (SIAM: Philadelphia) 
  
  r           = b - A*x;
  p           = r; 
  normb       = norm(b); 
  error       = norm(r)/normb; 
  flag        = 0; 
  if (error < tol); return; end 
  residual(1) = norm(r)/normb; 
  k           = 1; 
  
     while (k < maxit)  
         s              = A*p; 
         r01            = (r'*r); 
         alpha          = (r'*r)/(p'*s);      % step length 
         x              = x + alpha*p;        % approximate solution 
         r              = r - alpha*s;        % residual 
         beta           = (r'*r)/r01;         % improvement this step 
         p              = r + beta*p;         % serarch direction 
         residual(k)    = norm(r)/normb; 
         n(k)           = k;
         error          = norm(r)/normb ;
         k              = k + 1; 
         if (error < tol); flag = 1; break; end 
     end 
  