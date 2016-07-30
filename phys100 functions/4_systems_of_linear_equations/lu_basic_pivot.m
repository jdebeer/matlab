  function [L, U, P, d] = lu_basic_pivot(A) 
% function [L, U, P, d] = lu_basic_pivot(A) 
% Gaussian elimination with partial pivoting 
% INPUT:
%                  A = n-by-n matrix to be factored
% OUTPUT:
%                  L = n-by-n unit [L(k, k) = 1] lower triangular matrix  
%                  U = n-by-n upper matrix 
%                  P = n-by-n permutation matrix
%                  d = estimate of determinant 
%
%  Trefethen, L N & Bau, D, Numerical Linear Algebra,, p. 151
%         Algorithm 20.1  =>  PA = L*U 
 
n      = size(A, 1); 
P      = eye(n, n);
s      = 0; 
      for k = 1:n - 1
        [maxx, kmax] = max(abs(A(k:n, k)));   % Determines kmax relative to k
        kmax         = kmax + k - 1;          % Determines kmax relative to row 1
          if k ~= kmax
             A([kmax, k], :) = A([k, kmax], :);
             P([kmax, k], :) = P([k, kmax], :);
             s               = s  + 1; 
          end
        A(k + 1:n, k)       = A(k + 1:n, k)/A(k, k); 
        A(k + 1:n, k + 1:n) = A(k + 1:n, k + 1:n) - A(k + 1:n, k)*A(k, k + 1:n);
      end
  U      = triu(A);
  L      = tril(A, -1) + eye(n, n);
  d      = ((-1.0)^s)*prod(diag(U)); 
end