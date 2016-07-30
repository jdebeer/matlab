 function  roots = roots_via_laguerre(a, polish)  
% function  roots = roots_via_laguerre(a, polish)
% INPUT: 
%   a      = vector of coefficients of polynomial (real or complex) 
%   polish = logical(0/1) set to 1 if values are to be polished by 
%                laguerre's method 
%   NOTE: coefficients in form  a(i)x^(i - 1)
   epss = 1.0e-10; 
   a    = flipud(a); 
   ad   = a;             % copies coefficients for successive deflation 
   m    = length(a) - 1; % degree of polynomial 
   % loops over each root to be found 
      for j = m:-1:1  
         % start search at 0.0 to favor convergence to smallest remaining root  
         x        = complex(0.0, 0.0);  % initial guess 
         x        = laguerre(ad, j, x); % find the root 
         if abs(imag(x)) <= 2.0*(epss^2)*abs(real(x)); 
            x        = complex(real(x), 0.0); 
         end  % end if 
         roots(j, 1) = x;
         % Forward deflation 
         ad(j: -1:1) = partial_sum_polynomial(ad(j + 1:-1:2), x);
      end   % jth loop 
     % polish roots using undeflated coefficients 
      if polish 
         for j = 1:m
            roots(j, 1)  = laguerre(a, m, roots(j, 1));
         end  %jth loop     
      end  %endif polish 
end  % roots_via_laguerre


function x = laguerre(c, tol)

    if nargin < 2; tol = 1.0e3*eps; end

    n     = length(c);
    kmax  = 50;
    x     = randn;  % initiallize w random normal number Kiusalaas, p. 176  
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
           if abs(dx) < tol; break; end  % Exit if |x - a| < tol 
      end % end kth loop 
  x = Inf;
  disp('laguerre.m: fell thru loop');