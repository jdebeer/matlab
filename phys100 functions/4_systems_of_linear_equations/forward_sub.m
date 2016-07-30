function x = forward_sub(L, b)

n     = size(L, 1);
x     = zeros(size(b));

x(1) = b(1)/L(1, 1); 

  for i = 2:n
      if L(i, i) == 0.0; 
        x(i) = inf; disp('forward_sub: L is singular'); 
     end 
    x(i) = (b(i) - L(i, 1:i - 1)*x(1:i - 1))/L(i, i);
  end
end