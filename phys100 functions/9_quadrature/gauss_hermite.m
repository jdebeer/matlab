  function result = gauss_hermite(f, n)
% function result = gauss_hermite(f, n)
%  INPUT: 
%         f      = 1D function ['string'], function handle, or inline 
%         n      = number of dependent values
%  OUTPUT: 
%         result = integral 
% MODIFICATION of gaherm.m, integration from -infinity to infinity
% Numerical Methods Using MATLAB, 2nd Ed, p. 181
%  G Lindfield & J Penny (Prentice Hall: Upper Saddle River, NJ)
% Scientific Computing with MATLAB, A Quarteroni & F Saleri 
% (Springer-Verlag: Berlin), p. 93

[t,c] = coefficent_gauss_hermite(n); 
c     = c.*exp(t.^2); 
  s=0;
  for k=1:n
    x1 = t(k); 
    y  = f(x1);
    s  = s + c(k)*y;
  end
result = s;
  
function [x,w]= coefficent_gauss_hermite(n) 
% Numerical Mathematics, 2000, (Springer-Verlag: Berlin) 
% A Quateroni, R Sacco, & F Saleri  p. 430 
if (n <= 1), disp(' n must be > 1 '); return; end
[a,b] = coefficient_hermite_poly(n); 
JacM=diag(a)+diag(sqrt(b(2:n)),1)+diag(sqrt(b(2:n)),-1);
[w,x]=eig(JacM); x=diag(x); scal=sqrt(pi); w=w(1,:)'.^2*scal; 
[x,ind]=sort(x); w=w(ind);

function [a, b] = coefficient_hermite_poly(n)
% Numerical Mathematics, 2000, (Springer-Verlag: Berlin) 
% A Quateroni, R Sacco, & F Saleri  p. 430 
if (n <= 1), disp(' n must be > 1 '); return; end
a=zeros(n,1); b=zeros(n,1); b(1)=sqrt(4.*atan(1.));
for k=2:n, b(k)=0.5*(k-1); end
