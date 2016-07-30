  function [A, beta] = house_QR(A) 
% function [A, beta] = house_QR(A)
 % INPUT
 %          A  = (m-by-n) matrix  
 % OUTPUT 
 %          A   = m-by-n) matrix OVERWRITTEN 
 % upper triangular part of A overwritten by upper triangle R 
 % j+1:m components of jth House vector stored in A(j+1:m, j) j < m 
 %          beta = (n-by-1) vector
 % Matrix Computations, 3rd Ed. 
 % Golub, J H & van Loan, C F 
 % Algorithm 5.2.1 
 % (Johns Hopkins University Press, 1996), p. 224
      [m, n] = size(A);
      beta   = zeros(n, 1); 
          for j = 1:n    
             [u, beta(j)]   = house(A(j:m, j));
              A(j:m, j:n)   = (eye(m - j + 1) - beta(j)*u*u')* A(j:m, j:n); 
              if j < m; A(j + 1:m, j) = u(2:m - j + 1);  end
          end 
  end 
