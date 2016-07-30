  function x = solution_lu_pivot(A, b)
% function x = solution_lu_pivot(A, b)
% Solves Ax = b for x via LU elimination & PARTIAL pivoting
% INPUT:
%        A = n x n matrix
%        b = n-sized vector
% OUTPUT:
%        x = n-sized vector
 
    [L, U, P]  = lu_basic_pivot(A); 
    y          = forward_sub(L, P*b);  
    x          = back_sub(U, y);
end