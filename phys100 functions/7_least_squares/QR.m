  function [Q, R] = QR(A) 
% function [Q, R] = QR(A)
% INPUT: 
%         A = [m by n] array 
% OUTPUT: 
%         R = [m by m] upper triangular matrix 
%         Q = [m by m] dense matrix
%       
% QR factorization of a using Householder Transformations

  [m, n] = size(A); 
 
  QT     = eye(m);  

    for k = 1:n 
	     H           = eye(n, n); 
        [u, beta]    = house( A(k:m, k) );
        H_partial    = eye(length(u)) - beta*u*u';
        H(k:m, k:m)  = H_partial;  
        A            = H*A; 
	    QT           = H*QT; 
	    H            = H*H; 
    end
 
  R = triu(A); 
  Q = QT';
