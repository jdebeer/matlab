  function  r = roots_via_laguerre(c, tol)  
% function  r = roots_via_laguerre(c, tol)
% INPUT: 
%   a      = coefficients of polynomial (real or complex)  [vector]
%   tol    = absolute tolerance on calculation of root  [scalar]
% OUTPUT: 
%   r      = roots calculated via Laguerre's method  [vector]
% After root calculation polishes roots via Laguerre method 
% Driver routine is MATLAB translation of Fortran driver, zroots 
% [p.  367] Press, W H et al. 1992 Numerical Recipes in Fortran, 2nd Ed

if nargin < 2; tol = 1.0e2*eps; end

   cd   = c;             % copies coefficients for successive deflation 
   n    = length(c) - 1; % degree of polynomial 
   r    = zeros(n, 1); 
   % loops over each root to be found 
      for j = n:-1:1  
         % start search at 0.0 to favor convergence to smallest remaining root  
         x0   = complex(0.0, 0.0);     % initial guess of zero 
         x0 = 0; 
         x    = laguerre(cd, x0, tol); % finds the root 
        % Remove imaginary part if it too small & likely spurious
        if abs(imag(x)) <= 2.0*(tol^2)*abs(real(x)); 
           x        = complex(real(x), 0.0); 
        end  % end if 
         r(j) = x;
         % Forward deflation 
         cd = deflation_poly(cd, x);
      end   % jth loop 
     % polish roots using undeflated coefficients 
         for j = 1:n
            r(j)  = laguerre(c, r(j), tol);
         end  %jth loop      
end  % roots_via_laguerre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function x = laguerre(c, x0, tol)
% function x = laguerre(c, x0, tol)
% INPUT: 
%   c      = coefficients of polynomial (real or complex)  [vector]
%   tol    = absolute tolerance on calculation of root  [scalar]
% OUTPUT: 
%   x      = root calculated via Laguerre's method  [scalar]
% Alogithm is a mix of laguerre.m [p. 176] Kuisalaas, [p. 188] Acton, and
%   laguerre [p. 366]Price et al 
%  
    if nargin < 3; tol = 1.0e3*eps; end

    n     = length(c);
    kmax  = 50;  
    x     = x0; 
      for k = 1: kmax
         [p, dp, d2p] = evaluate_poly(c, x);
         if abs(p)  < tol; return; end   % Exit if |Pn(x)| < tol 
         G            = dp/p; 
         H            = G*G - d2p/p; 
         sq           = sqrt( (n - 1.0)*(n*H - G*G) ); 
           if abs(G + sq) > abs(G - sq)
             dx  = n/(G + sq); 
           else
             dx  = n/(G - sq);
           end
        x = x - dx; 
           if abs(dx) < tol; return; end  % Exit if |x - a| < tol 
      end % end kth loop
   x = Inf;
   disp('laguerre.m: fell thru loop');
  end % laguerre
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
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
  end  % evaluate_poly
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    end % deflation_poly 
  