  function result = gauss_quadrature(f, a, b, n)
% function result = gauss_qyadrature(f, a, b, n)
%  INPUT: 
%         f      = 1D function  
%         a      = minimum dependent value
%         b      = maximum dependent value
%         n      = number of dependent values
%  OUTPUT: 
%         result = integral 

 [t, c]  = gauss_coef(n - 1); 
 
  x      = (t*(b-a)  + a + b)/2.0;
  s      = sum(c.*f(x)); 
  result =(b - a)*s/2.0;
 end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 function [t, c] = gauss_coef(n)
% Trefethen, L N (2008)
% SIAM Review, 50, 67-87  
% (n+1)-pt Gauss quadrature of f
beta    = .5./sqrt(1-(2*(1:n)).^(-2)); % 3-term recurrence coeffs
T       = diag(beta,1) + diag(beta,-1); % Jacobi matrix
[V, D]  = eig(T); % eigenvalue decomposition
x       = diag(D); [x,i] = sort(x); % nodes (= Legendre points)
w       = 2*V(1,i).^2; % weights
t       = x'; c = w;
 end


  
  