 function yy = periodic_spline(x, y, xx)
%function yy = periodic_spline(x, y, xx)
% Input:
%         x of data points 
%         y of data points y(x)
%         xx of the points to be fitted
% Output:
%         Corresponding yy(xx) 

% 1) Introduction to Numerical Analysis, 2nd Ed
%      by J Stoer & R Bulirsch (1992), p. 100
% 2) Numerical Computation in Science & Engineering
%      by C Pozrikidis  [splc_pr]

% n = NUMBER OF INTERVALS 
% (x,f) k = 1:n 
    n     = length(x) - 1; 
       for i = 1: n - 1
          a(i)     = y(i); 
          h(i)     = x(i+1) - x(i); 
          f(i)     = y(i+1) - y(i);
       end 
    a(n)   = y(n);
    h(n)   = h(1);
    f(n)   = y(n+1) - y(n);
    
    % Tridiagonal system 
    dia    = zeros(n,1);
    sub    = zeros(n,1);
    sup    = zeros(n,1); 
    b      = zeros(n,1); 
    A      = zeros(n,n); 
    dia(n) = 2.0*(h(1) + h(n)); 
    sup(n) = h(1); 
    sub(n) = h(n); 
    b(n)   = 3.*(   (y(2) -y(1))/h(1) - (y(n+1) -y(n))/h(n)  ); 
       for k =  1:n - 1
          dia(k) = 2.0*(h(k) + h(k + 1));
          sub(k) = h(k); 
          sup(k) = h(k + 1); 
          b(k)   = 3.*( f(k + 1)/h(k+1) - f(k)/h(k) ); 
       end 
       
    % J Stoer & R Bulirsch, Introduction to Numerical Analysis ,2nd Ed
    % Springer, Berlin, _  
    A             = diag(dia) + diag(sub(2:end),-1) + diag(sup(1:end -1), +1);
    A(1, n)       = h(1); 
    A(n, 1)       = h(1); 
    A(n, n - 1)   = h(n - 1); 
    c = A\b;
    c(2:n + 1) = c;
    c(1)       = c(n + 1); 

       for k = 1:n 
          d(k) = (c(k+1) - c(k))/(3.0*h(k));
       end  
        
       for k = 1:n 
           b(k) = f(k)/h(k) - (h(k)/3.0)*(c(k+1) + 2.0*c(k));
       end         
   
    m  = length(xx);
    yy = zeros(m, 1); 
    ko = find(xx < x(1));
       if ~isempty(ko)
          disp('Some xx below lowest x value'); 
       end 
    ki = find(xx> x(n + 1));
       if ~isempty(ki)
          disp('Some xx above hightest x value'); 
       end 

       for k = 1:n 
           jk = find( (xx >= x(k)) &  (xx <= x(k+1)) ); 
           % reverse order 
           %p = [ x(k) d(k) c(k)   b(k) a(k)]; disp(p); 
           yy(jk) = a(k)+ b(k).*(xx(jk) - x(k)) + c(k).*(xx(jk) - x(k)).^2 ...
                      +d(k).*(xx(jk) - x(k)).^3;  
       end  