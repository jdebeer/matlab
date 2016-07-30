function x = simple_gauss_elim(A, b) 
 
n = size(A, 1);
% Augmented matrix 
A = [A b]; 
 
  for k = 1:n - 1
     for j = k + 1:n
          if A(k, k) == 0.0;  
            disp('simple_gauss_elim: A is singular');
            x = nan(size(b)); 
            return; 
          end
        m       = +A(j, k)/A(k, k);
        A(j, :) = A(j, :) - m*A(k, :);
     end  
  end 
 
% Extract A and from the augmented matrix  
b           = A(:, n + 1);
A(:, n + 1) = []; 
x           = back_sub(A, b);
end
