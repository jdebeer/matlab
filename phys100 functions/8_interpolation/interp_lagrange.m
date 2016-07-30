  function p = interp_lagrange(t, y, tt)
% function p = interp_lagrange(t, y, tt)
% INPUT:
%      points to be interpolated:  y as function of t 
%       t  = m by 1 vector
%       y  = m by 1 vector
%       tt = n by 1 vector points to be interpolated 
% OUTPUT: 
%       p           = n by 1 vector   p(tt) 
% Algorithm (p. 305) from Ascher, U M &  Greif C 2011 
% A First Course in NUMERICAL METHODS (SIAM: Philadelphia PA)

% Construction: compute barycentric weights 
   t = t(:); y = y(:); tt = tt(:); % Ensures all inputs are column vectors
   m  = length(t);   nn = length(tt); 
   D  = repmat(t, 1, m) - repmat(t', m, 1) + diag(ones(m, 1)); 
   w  = 1./prod(D)';    % Computes weights 
   
 % Evaluate 
   D  = repmat(tt, 1, m) - repmat(t', nn, 1);  % Computes tt - t 
   R  = 1./(D + eps*(D == 0.0)); % Reciprocals of tt - t & sets zero elements to eps 
   p  = R*(w.*y)./(R*w);
end