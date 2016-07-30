function [x, error, iter, flag, residual, n] = jacobi(A, x, b, maxit, tol) 

  M           = diag(diag(A));           % D = diagonal components of A
  N           = diag(diag(A)) - A;       % N = + L + U 
  r           = b - A*x;
  r0          = norm(r);
  normb       = norm(b); 
  error       = r0/normb; 
  flag        = 0;                       % Set flag to be false, 0 
  if (error < tol); return; end 
  residual(1) = error; 
  
     for iter = 2:maxit                  % A*x = b => x = A\b % MATLAB backslash
         x              = M\(N*x + b);   %   x = D\((L + U)*x + b) = D\(N*x + b)
         r              = b - A*x;
         residual(iter) = norm(r)/normb; 
         n(iter)        = iter;
         error          = residual(iter); 
         if (error < tol); flag = 1; break; end 
     end 
  