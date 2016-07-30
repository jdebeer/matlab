  function [Q, R] = house_full_QR(A) 
% function [Q, R] = house_full_QR(A)
% INPUT
%          A    m-by-n matrix  
% OUTPUT: 
%         Q     m-by-m orthogonal matrix 
%         R     m-by-n upper triangular matrix

% Matrix Computations, 3rd Ed. 
% Golub, J H & van Loan, C F 

 [m, n]    = size(A);
 [A, beta] = house_QR(A);  % jch version of GvL 5.2.1 
 R         = triu(A); 
 I         = eye(m,m);
 Q         = I; 
 
 % jch version of GvL equation 5.1.5 
      for j = n:-1:1
          u(j:m, 1)  = [1.0; A(j+1:m, j)]; 
         Q(j:m, j:m) = (I(j:m, j:m) - beta(j)*u(j:m)*u(j:m)')*Q(j:m, j:m); 
      end
  end

 
 
