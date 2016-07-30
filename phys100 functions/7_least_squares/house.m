   function [u, beta] = house(x)
 % function [u, beta] = house(x)
 % INPUT
 %          x  = (n by 1) column vector 
 % OUTPUT 
 %          u    = (n by 1) column vector
 %          beta = 2/(uT*u)
 % Given vector, x,  house computes u such that H = In - beta*u*u^T and
 % Px = |||x||_2*e_1
 % Matrix Computations, 3rd Ed. 
 % Golub, J H & van Loan, C F 
 % Algorithm 5.1.1 
 % (Johns Hopkins University Press, 1996), p. 210

     if ~iscolumn(x); 
       disp('input is NOT column vector'); 
       u = inf; beta = nan; 
       return; 
     end  
   n      = length(x); 
   sigma  = x(2:n)'*x(2:n);
   u      = [1; x(2:n)];
     if sigma == 0.0
         beta = 0.0;
     else 
         mu   = sqrt(x(1)^2 + sigma);
           if x(1) <= 0.0 
               u(1) = x(1) - mu;
           else 
             u(1) = -sigma/(x(1) + mu); 
           end
         beta = (2.0*u(1)^2)/(sigma + u(1)^2);
         u    = u/u(1); 
     end 
   end

