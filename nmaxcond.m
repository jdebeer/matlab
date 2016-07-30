function [n c ] = nmaxcond(nmax)



n=0;
c = 0;

while c < 1/eps
    
    n = n + 1;
    
    if n <= nmax
        
    one = ones(n)*-1;
    upones = triu(one, 1);
    eyes = eye(n);
    A = upones + eyes;
    c = cond(A,1);
    
    
    else
    end
    
end
end