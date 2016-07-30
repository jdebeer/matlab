  function [p, dp, d2p] = evaluate_poly(c, x)
% function [p, dp, d2p] = evaluate_poly(c, x)
%  INPUT:
%     c    coefficients of n-degree polynomial, Pn(x), length (n + 1)
%     x    scalar independent variable 
%  OUTPUT 
%     p    = Pn(x)        polynomial evaluated at x
%     dp   = dPn(x)/dx    first derivative of polynomial evaluated at x 
%     d2p  = d2Pn(x)/dx2  second derivative of polynomial evaluated at x 
% Kiusalaas, J. 2005, Numerical Methods in Engineering in MATLAB [p. 173]
%  [Cambridge: Cambridge, UK]

   n   = length(c) - 1;
   p   = c(1); 
   dp  = 0.0;
   d2p = 0.0; 
    for k = 1:n 
	  d2p = 2.0*dp + x*d2p; 
	  dp  = p + x*dp; 
      p   = p*x + c(k + 1); 
    end
