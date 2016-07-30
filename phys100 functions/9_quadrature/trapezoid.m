   function result = trapezoid(f, a, b, N) 
%  function result = trapezoid(f, a, b, N)
%  INPUT: 
%         f    = 1D function 
%         a    = minimum dependent value
%         b    = maximum dependent value
%         N    = number of dependent values
%  OUTPUT: 
%         result = integral 
%       .. Composite trapezoid rule ..
% Scientific Computing with MATLAB, A Quarteroni & F Saleri 
% (Springer-Verlag: Berlin), p. 91

           result     = 0.0;
           h          = (b - a)/(N - 1);
           x          = a:h:b;
           integrand  = f(x);
           result     = h* ( 0.5*(f(a) + f(b)) + ...
                             + sum( integrand(2:end - 1))  );         
