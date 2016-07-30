function [x, error, iter, flag, residual, n] = sor(A, x, b, w, maxit, tol) 

  b           = b*w;  % redefined 
  M           = +w*tril(A, -1) + diag(diag(A));
  N           = -w*triu(A, +1) + (1.0 - w)*diag(diag(A));
  r           = b/w - A*x;
  r0          = norm(r);
  normb       = norm(b/w); 
  error       = r0; 
  flag        = 0;                % Set flag to be false, 0
  if (error < tol); return; end 
  residual(1) = r0/normb; 
  
     for iter = 2:maxit
         x              = M\(N*x + b); 
         r              = (b/w) - A*x;
         residual(iter) = norm(r)/normb; 
         n(iter)        = iter;
         error          = norm(r)/normb; 
         if (error < tol); flag = 1; break; end 
     end 