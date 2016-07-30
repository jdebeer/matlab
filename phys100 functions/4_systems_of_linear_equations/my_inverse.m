function Inv = my_inverse(A) 
 
   n      = size(A, 1); 
   I      = eye(n); 
   Inv    = zeros(size(A)); 
   [L, U] = lu_fact_no_pivot(A);
   
      for j = 1:n
           y          = forward_sub(L, I(:, j));
           Inv(:, j)  = back_sub(U, y);
      end    
end