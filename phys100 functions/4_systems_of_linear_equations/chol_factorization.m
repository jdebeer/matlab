  function L = chol_factorization(A)
% function L = chol_factorization(A)
% INPUT:
%        A = positive definite n x n matrix
% OUTPUT:
%        L = n x n matrix (lower triangle)
%        where   A = L*L' 
 
% Check to see if A is a square matrix
   [nr, nc] = size(A);
   if nr ~= nc; error('chol_factorization.m: A is not square'); end 
   n  = nr; 
   for j = 1:n
         for k = 1:j - 1
           A(j, k) = (A(j, k) - sum(A(k, 1:k - 1)*A(j, 1:k - 1)'))/A(k, k); 
         end
      A(j, j) = sqrt( A(j, j) - A(j, 1:j - 1)*A(j, 1:j - 1)');
   end
  L = tril(A);
end
