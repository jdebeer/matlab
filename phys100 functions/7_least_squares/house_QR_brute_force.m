 function [Q, R] = house_QR_brute_force(A) 
%function [Q, R] = house_QR_brute_force(A)
% INPUT: 
%         A     m-by-n matrix 
% OUTPUT: 
%         Q     m-by-m orthogonal matrix 
%         R     m-by-n upper triangular matrix  
% 
% Applys Householder transformations to remove
%   subdiagonals Hn*Hn-1 ...H3*H2*H1*A = R 
%   Q^T = Qn*Qn-1 ... Q3*Q2*Q1 => Q = (Q^T)^T 
% Contains essential features of qr factorization BUT
%   is very inefficient: ~nm^3 operations 
  
      [m,n]  = size(A); 
      I      = eye(m);  
      Qt     = I; 
          for j = 1:n 
            H               = I; 
            [u, beta]       = house( A(j:m, j) );
            H(j:m, j:m)     = eye(length(u)) - beta*u*u';
            A               = H*A;
            Qt              = H*Qt; 
          end    
      Q = Qt'; 
      R = A; 
end 