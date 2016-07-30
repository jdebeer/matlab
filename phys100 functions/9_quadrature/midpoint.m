   function result = midpoint (f, a, b, N)
%  function result = midpoint (f, a, b, N)
%  INPUT: 
%         f      = 1D function 
%         N      = number of dependent values 
%         a      = minimum dependent value 
%         b      = maximum dependent value 
%  OUTPUT: 
%         result = integral 
%       .. Composite Midpoint rule .. 
%       .. Vectorized version of midpoint rule .. 
% Scientific Computing with MATLAB, A Quarteroni & F Saleri 
% (Springer-Verlag: Berlin), p. 89

           result = 0.0;
           h      = (b - a)/N;
           x      = linspace(a + h/2.0, b - h/2.0, N); 
           result = sum(f(x)*h);  
