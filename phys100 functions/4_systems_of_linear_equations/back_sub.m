function x = back_sub(U, b)

n     = size(U, 1);
x     = zeros(size(b));

x(n) = b(n)/U(n, n);
  for i = n -1 :-1:1
    if U(i, i) == 0.0; 
      x(i) = inf; disp('back_sub: U is singular'); 
    end 
    x(i) = (b(i) - U(i, i + 1:n)*x(i + 1:n) )/U(i, i);
  end
end