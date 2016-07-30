  function [L, U] = lu_fact_no_pivot(A) 
% function [L, U] = lu_fact_no_pivot(A) 
% Gaussian elimination WITHOUT partial pivoting 
% INPUT:
%                  A = n-by-n matrix to be factored
% OUTPUT:
%                  L = n-by-n unit [L(k, k) = 1] lower triangular matrix  
%                  U = n-by-n upper matrix 
n      = size(A, 1); 
U      = A; 
L      = eye(n); 
   
   for k = 1:n - 1
     L(k + 1:n, k)   = U(k + 1:n, k)/U(k, k); 
     U(k + 1:n, k:n) = U(k + 1:n, k:n) - L(k + 1:n, k)*U(k, k:n); 
   end
end
