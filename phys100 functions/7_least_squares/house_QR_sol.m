function beta = house_QR_sol(A, b) 
 [m, n]    = size(A);
 [A, beta] = house_QR(A);
      for j = 1:n
         u(j, 1)       = 1;   
         u(j + 1:m, 1) = A(j + 1:m, j); 
         b(j:m)        =  (eye(m - j + 1) - beta(j)*u(j:m)*u(j:m)')*b(j:m); 
      end
   beta = back_sub(A(1:n, 1:n), b(1:n)); 
end