function [L, U] = lu_fact_band(A, r, s) 
% Variant on Banded Gaussian Elimination, Algorithm 7.7 
%  Dahlquist, G & Bjorck, A 2008  p. 84 [SIAM]
% Numerical Methods in Scientific Computing, 2
   
n      = size(A, 1); 
U      = A; 
L      = eye(n); 
   
  for k = 1:n - 1
       for i = k + 1:min(k + s, n)
          L(i, k)    = U(i, k)/U(k, k); 
             for j = k:min(k + r, n) 
               U(i, j) = U(i, j) - L(i, k)*U(k, j); 
             end % end jth loop
       end % end ith loop 
  end
