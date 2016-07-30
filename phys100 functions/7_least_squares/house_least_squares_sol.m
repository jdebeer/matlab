  function beta = house_least_squares_sol(A, b) 
% function beta = house_least_squares_sol(A, b) 
 % INPUT
 %          A  = (m-by-n) matrix  
 % OUTPUT 
 %          A   = m-by-n) matrix OVERWRITTEN 
 % upper triangular part of A overwritten by upper triangle R 
 % j+1:m components of jth House vector stored in A(j+1:m, j) j < m 
 %          beta = (n-by-1) vector
 % Matrix Computations, 3rd Ed. 
 % Golub, J H & van Loan, C F 
 % Algorithm 5.3.2
 % (Johns Hopkins University Press, 1996), p. 240
  [A, beta] = house_QR(A); 
  [m, n]    = size(A); 
      for j = 1:n
         u(j, 1)       = 1;   
         u(j + 1:m, 1) = A(j + 1:m, j); 
         b(j:m)        =  (eye(m - j + 1) - beta(j)*u(j:m)*u(j:m)')*b(j:m);
      end
   beta = back_sub(A(1:n, 1:n), b(1:n)); 
end