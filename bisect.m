function [m, k] = bisect(f,a,b,tol)

kmax = 500;

    for k = 1:kmax
        m = (a + b)/2;
% NOTE: activating return exits bisect
    if (abs(a - b) <= tol); return; end 
    if sign(f(m)) == sign(f(b))
b = m;
    else
a = m;
           
    end
    end