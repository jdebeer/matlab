  function result = gauss_laguerre(f, n)
% function result = gauss_laguerre(f, n)
%  INPUT: 
%         f      = 1D function
%         n      = number of dependent values
%  OUTPUT: 
%         result = integral 
% MODIFICATION of galag.m, integration from 0 to infinity
% Numerical Methods Using MATLAB, 2nd Ed, p. 177
%  G Lindfield & J Penny (Prentice Hall: Upper Saddle River, NJ)
% Scientific Computing with MATLAB, A Quarteroni & F Saleri 
% (Springer-Verlag: Berlin), p. 93

[t, c] = coefficient_gauss_laguerre(n); 
c      = c.*exp(t); 
  s = 0;
  for k =1 :n
    x=t(k); y = f(x);
    s=s + c(k)*y;
  end
result = s; 
  
function [x, w] = coefficient_gauss_laguerre(n)
% Numerical Mathematics, 2000, (Springer-Verlag: Berlin) 
% A Quateroni, R Sacco, & F Saleri  p. 430 
if (n <= 1), disp(' n must be > 1 '); return; end
[a,b] = ceofficient_laguerre_poly(n); 
JacM=diag(a)+diag(sqrt(b(2:n)),1)+diag(sqrt(b(2:n)),-1);
[w,x]=eig(JacM); x=diag(x); w=w(1,:)'.^2;

function [a, b] = ceofficient_laguerre_poly(n)
% Numerical Mathematics, 2000, (Springer-Verlag: Berlin) 
% A Quateroni, R Sacco, & F Saleri  p. 430 
if (n <= 1), disp(' n must be > 1 '); return; end
a=zeros(n,1); b=zeros(n,1); a(1)=1; b(1)=1;
for k=2:n, a(k)=2*(k-1)+1; b(k)=(k-1)^2; end
