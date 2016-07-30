function [x, k] = newton(f, fprime, x, tol) 

kmax = 1001;


for k = 1:kmax xprev = x;
    
x = xprev - f(x)/fprime(x);

fprintf('k = %2.0d x = %+20.14e \n', k, x);

if abs(x - xprev) <= tol || isinf(x) || isnan(x); 
    return;
end

end

x = Inf; % fell through for loop % end of newton

end