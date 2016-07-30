function [Tmplus1 T] = cheb(n)

m = n-1;

syms x


Tmplus1 = x;
Tm = 1;
T = Tmplus1;

if m > 0
    
for i = 1:m
    Tmless1 = Tm;
    Tm = Tmplus1;
    Tmplus1 = 2*x*Tm - Tmless1;
    T = T*Tmplus1;
    
end
elseif m == 0
    T = Tmplus1;


else
end

T


end