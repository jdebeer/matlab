 function x = tridiagonal(a, b, c, rhs) 
%function x = tridiagonal(a, b, c, rhs)
%Tridiagonal solver where A*X = rhs and 
%  a = n-by-1 vector   main diagonal 
%  b = n-by-1 vector   subdiagonal
%  c = n-by-1 vector   superdiagonal diagonal
%  Dahlquist, G & Bjorck, A 2008  [SIAM]
% Numerical Methods in Scientific Computing, 2
   
    n        = length(a);
    alpha    = zeros(size(a)); 
    gamma    = zeros(size(a)); 
   
    alpha(1) = a(1); 
       for k = 2:n 
         gamma(k) = b(k)/alpha(k - 1); 
         alpha(k) = a(k) - gamma(k)*c(k); 
       end
   
  % L*y     = rhs  => U*x = y 
   y        = zeros(size(a)); 
   x        = zeros(size(a)); 
   
   y(1)     = rhs(1); 
     for k = 2:n
        y(k) = rhs(k) - gamma(k)*y(k - 1); 
     end
   
   x(n)    = y(n)/alpha(n);
     for i = n - 1:-1:1
        x(i) = (y(i) - c(i + 1)*x(i + 1))/alpha(i);       
     end
  
 emd 