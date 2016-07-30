
  function result = simpson(f, a, b, N) 
% function result = simpson(f, a, b, N)
%  INPUT: 
%         f    = 1D function 
%         a    = minimum dependent value
%         b    = maximum dependent value
%         N    = number of dependent values
%  OUTPUT: 
%         result = integral 
%       .. Composite Simpson's rule .. 

          result    = 0.0; 
          h         = (b - a)/N; 
          x         = linspace(a, b, N + 1); 
          integrand = f(x); 

%         .. Loop for odd points ..                                                   
          result = 4.0 * sum( integrand(2:2:end - 1) ); 

%          .. Loop for even points  ..                                                 
          result = result + 2.0 * sum( integrand(3:2:end - 1) ); 
  
%          .. Add the endpoints ..                                                     
           result = result + f(a) + f(b); 
           result = result*h/3.0;    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%