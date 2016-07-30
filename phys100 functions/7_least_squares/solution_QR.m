  function beta = solution_QR(A, b) 
% function beta = solution_QR(A, b) 
% INPUT: 
%         A = [m by n] array 
%         b   [m x 1 ] vector 
% OUTPUT:
%         beta = [n x 1 ] vector 
%       
% QR factorization of a using Householder Transformations
  
      [m, n] = size(A); 
      [Q, R] = qr_brute_force(A); 
      b      = Q'*b; 
      beta   = back_sub(R(1:n, 1:n), b(1:n)); 
 end
