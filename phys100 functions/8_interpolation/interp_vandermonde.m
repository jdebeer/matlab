  function [p, cond_number] = interp_vandermonde(t, y, tt)
% function [p, cond_number] = interp_vandermonde(t, y, tt)
% INPUT:
%      points to be interpolated:  y as function of t 
%       t  = m by 1 vector
%       y  = m by 1 vector
%       tt = n by 1 vector points to be interpolated 
% OUTPUT: 
%       p           = n by 1 vector   p(tt) 
%       cond_number = condition number calculated by linsolve 
% 
% Algorithm based on InterpV.m of van Loan C F (2000) [p. 79] 
% Introduction to Matrix Computing: A Matrix-Vector Approach Using MATLAB
%   2nd Ed [Prentice-Hall: Upper Saddle River NJ] 

    m       = length(t); 
    t       = t(:);  % Forces t to be a column vector 
    y       = y(:);  % forces y to be a column vector 
    V       = zeros(m, m); 
    V(:, m) = ones(size(t)); 
    
% Observe that coefficient matrix V in constructed from right to left -– 
%  => from the last column to the first column 
      for j = 1:m - 1
         V(:, m - j) = t.^j; 
      end 
      
  % c is coefficient of polynomial & R is reciprocal of condition number
  [c, R] = linsolve(V, y);   cond_number = 1.0/R; 
  
 % Employ Horner's method to evaluate the polynomial fit 
 % Each p(tt) computation requires approx 2m floating-point operations 
  p = c(1)*ones(size(tt)); 
     for j = 2:m
      p =  c(j) + tt.*p ; 
     end    
end % interp_vandermonde
  
  
    