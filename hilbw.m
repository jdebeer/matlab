function [dif condH normr] = hilbw(nmax)

n = 1;
max = 1;
dif = zeros(n,1);

while max > dif
    max = ones(n,1);

    if n <= nmax
    
    H = hilb(n);
    x = ones(n,1);
    b = H*x;
    t = linsolve(H,b);
    dif = x - t;
    n = n+1;
    n
    condH = cond(H)
    
    else
    end
end


r = b - H*t;
normr = norm(r);

end