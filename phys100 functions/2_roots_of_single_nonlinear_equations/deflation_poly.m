  function h = deflation_poly(c, r)
% function h = deflation_poly(c, r)
%  INPUT:
%         c    coefficients of n-degree polynomial, Pn(x), length (n + 1)
%         r    scalar value of root 
%  OUTPUT 
%         h    coefficients of reduced polynomial, Pn-1(x), length(n) 
%   Horner's  deflation algorithm [p. 174]
% Deflates coefficients of polynomial Pn(x) using root value r where 
%         (x - r)Pn-1(x) = Pn(x)  
%         c(k) coefficients of Pn(x) and h(k) coefficients of Pn-1(x)
% Kiusalaas, J. 2005, Numerical Methods in Engineering in MATLAB 
%  [Cambridge: Cambridge, UK]

   n = length(c) - 1;
   h = zeros(n, 1); 
   h(1) = c(1); 
      for k = 2:n 
          h(k) = c(k) + r*h(k - 1); 
      end