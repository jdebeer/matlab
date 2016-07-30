  function p = interp_newton(t, y, tt)
% function p = interp_newton(t, y, tt)
% INPUT:
%      points to be interpolated:  y as function of t 
%       t  = m by 1 vector
%       y  = m by 1 vector
%       tt = n by 1 vector points to be interpolated 
% OUTPUT: 
%       p           = n by 1 vector   p(tt) 
% 
% Algorithm based on InterpN.m & HornerN of van Loan C F (2000) [p. 85] 
% Introduction to Matrix Computing: A Matrix-Vector Approach Using MATLAB
%   2nd Ed [Prentice-Hall: Upper Saddle River NJ] 
 
    m       = length(t); 
    t       = t(:);   % Forces t to be a column vector 
    y       = y(:);   % Forces y to be a column vector
    tt      = tt(:);  % Forces tt to be a column vector 
    
    c       = newton_coefficients(t, y); 
  
% Employ Horner's method to evaluate the polynomial fit 
% Code fragment based HornerN (p. 87) 
  p = c(m)*ones(size(tt)); 
     for j = m - 1:- 1:1
      p =  c(j) + (tt - t(j)).*p ; 
     end    
end % interp_newton
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function c = newton_coefficients(t, y)
% Algorithm based on InterpN.m of van Loan C F (2000) [p. 87]
 
  m    = length(t);
    for j = 1:m - 1  
      y(j+1:m) = (y(j+1:m) - y(j))./(t(j+1:m) - t(j));   
    end
  c = y;
end
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

