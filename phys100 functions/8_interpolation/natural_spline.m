 function yy = natural_spline(x, y, xx)
%function yy = natural_spline(x, y, xx)
% Input:
%         x of data points 
%         y of data points y(x)
%         xx of the points to be fitted
% Output:
%         Corresponding yy(xx) 

    n     = length(x); 
       for i = 1: n - 1
           a(i) = y(i); 
          h(i)     = x(i+1) - x(i); 
          f(i)     = y(i+1) - y(i);
       end 
  
       % Tridiagonal system for the unknown c 
       dia    = zeros(n,1);
       sub    = zeros(n,1);
       sup    = zeros(n,1); 
       dia(1) = 1; dia(n) = 1; b(1) = 0; b(n) = 0; 
       for k = 2:n - 1
          dia(k) = 2.0*(h(k - 1) + h(k));
          sub(k) = h(k - 1); 
          sup(k) = h(k); 
          b(k)   = 3.*(f(k)/h(k) - f(k-1)/h(k-1));
       end 
    A = diag(dia) + diag(sub(2:end),-1) + diag(sup(1:end -1), +1);
    c = A\b'; 
    
       for k = 1:n - 1
           %a(i) = y(i); 
           d(k) = (c(k+1) - c(k))/(3.0*h(k));
           b(k) = f(k)/h(k) - (h(k)/3.0)*(c(k+1) + 2.0*c(k));
       end    

    m  = length(xx);
    yy = zeros(m, 1); 
    
    % Set to y(xx) = 0 for xx < x(1) and xx > x(end)
    k = find(xx < x(1));
    yy(k) = 0.0;
    if ~isempty(k); disp('Some xx < x(1)');end   
    k = find(xx> x(end));
    yy(k) = 0.0; 
    if ~isempty(k);disp('Some xx > x(end)'); end
 
     % Determines yy(xx) for x(1) <= xx < x(end)
       for k = 1:n - 1   
           jk = find( (xx >= x(k)) &  (xx <= x(k+1)) ); 
           yy(jk) = a(k)+ b(k).*(xx(jk) - x(k)) + c(k).*(xx(jk) - x(k)).^2 ...
                       +d(k).*(xx(jk) - x(k)).^3;               
       end  
   
     
 

   