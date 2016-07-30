function x = solution_lu_no_pivot(A, b)
  
 [L, U]   = lu_fact_no_pivot(A); 
  y       = forward_sub(L, b);  
  x       = back_sub(U, y); 
end
