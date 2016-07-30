function [x, error, iter, flag, residual, n] = gauss_seidel(A, x, b, maxit, tol) 

  M           =  tril(A);      % lower includes diagonal 
  N           = -triu(A, 1);   % strictly upper trianglar matrix (no diagonal) 
  r           = b - A*x;
  r0          = norm(r);
  normb       = norm(b); 
  error       = r0/normb; 
  flag        = 0;             % Set flag to be false, 0
  if (error < tol); return; end 
  residual(1) = r0; 
  
     for iter = 2:maxit
         x              = M\(N*x + b);   
         r              = b - A*x;
         residual(iter) = norm(r)/normb;
         n(iter)        = iter;
         error          = residual(iter); 
         if (error < tol); flag = 1; break; end 
     end
     