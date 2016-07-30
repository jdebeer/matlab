  function result = adaptive_simpson(f, a, b, tol) 
% function result = adaptive_simpson(f, a, b, tol)
%  INPUT: 
%         f      = 1D function ['string'], function handle, or inline 
%         a      = minimum dependent value
%         b      = maximum dependent value
%         tol    = required absolute (NOT relative) accuracy of the solution 
%  OUTPUT: 
%         result = integral 
%       .. Adaptive Simpson's rule ..
% Programmer's Guide to Fortran 90, 2nd Ed. (1994), p. 240 
% W S Brainerd, C H Goldberg, J C Adams [Unicomp: Albuquerque, NM] 
   
    mid = (b + a)/2.0; 
    one_simpson_area = simpson_approx (f, a, b); 
    two_simpson_area = simpson_approx (f, a, mid) + simpson_approx (f, mid, b); 
    if( abs(one_simpson_area - two_simpson_area) < 15.0*tol )   
              result = two_simpson_area; 
    else
         left_area   = adaptive_simpson (f, a, mid, tol);
         right_area  = adaptive_simpson (f, mid, b, tol);
         result      = left_area + right_area;
    end 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [integral_estimate, m] = simpson_approx (f, a, b)
     h = (b - a)/2.0;
     integral_estimate = h*(f(a) + 4.0*f(a + h) + f(b) )/3.0; 
end