g=@(x) sin(10*x) - x;

a = -2;
b = 2;

tol = 0.0001;

kmax = 101;


for k = 1:kmax
    m = (a + b)/2;
    
    if (abs(a-b) <= tol); return; end
    if sign(g(m)) == sign(g(b))
        b = m;
    else
        a = m;
    end
end

x = [a m b];

g(x)



