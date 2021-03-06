 function yy = clamped_spline(x, y, v1, vn, xx)
%function yy = clamped_spline(x, y, v1, vn, xx)
% Input:
%         x of data points 
%         y of data points y(x)
%         v1 = slope at x1
%         vn = slope at xn 
%         xx of the points to be fitted
% Output:
%         Corresponding yy(xx) 

 % (x,f) k = 1:n 
    n     = length(x); 
       for i = 1: n - 1
          a(i)     = y(i); 
          h(i)     = x(i+1) - x(i); 
          f(i)     = y(i+1) - y(i);
       end 
  
       % Tridiagonal system 
       dia    = zeros(n,1);
       sub    = zeros(n,1);
       sup    = zeros(n,1); 
       % Clamped Spline: dia(1) = 2h(1)  & dia(n) = 2 
       % Clamped Spline: b(1) = v1 & v(n) = vn 
       dia(1) = 2*h(1);     sup(1) = h(1);
       dia(n) = 2*h(n - 1); sub(n) = h(n -1); 
       b(1)   = 3*(f(1)/h(1)- v1) ; 
       b(n)   = 3*(vn - f(n -1)/h(n-1) ); 
       for k = 2:n - 1
          dia(k) = 2.0*(h(k - 1) + h(k));
          sub(k) = h(k - 1); 
          sup(k) = h(k); 
          b(k)   = 3.*(f(k)/h(k) - f(k-1)/h(k-1));
       end 
    A = diag(dia) + diag(sub(2:end),-1) + diag(sup(1:end -1), +1);
    c = A\b'; 
    
       for k = 1:n - 1
          d(k) = (c(k+1) - c(k))/(3.0*h(k));
       end    
       for k = 1:n - 1
           b(k) = f(k)/h(k) - (h(k)/3.0)*(c(k+1) + 2.0*c(k));
       end    

    m  = length(xx);
    yy = zeros(m, 1); 
    ko = find(xx < x(1));
       if ~isempty(ko)
          disp('Some xx below lowest x value'); 
       end 
    ki = find(xx> x(n));
       if ~isempty(ki)
          disp('Some xx above hightest x value'); 
       end 
 
       for k = 1:n - 1
           jk = find( (xx >= x(k)) &  (xx <= x(k+1)) ); 
           yy(jk) = a(k)+ b(k).*(xx(jk) - x(k)) + c(k).*(xx(jk) - x(k)).^2 ...
                       +d(k).*(xx(jk) - x(k)).^3;               
       end  