function  example_bisection_01 

  f   = @(x) (x^2 - 2.0);
  a   = 1.0; b   = 2.0;
   
  tol   = eps; 
  kmax  = 128; 
  
  fprintf('example_bisection_01.m:\n\n');  
  fprintf('     Enclosing Interval                           Approximation\n'); 
  % Termination criterion: absolute error in root location 
    for k = 1: kmax 
      m = (a + b)/2;  
      fprintf('k = %2.0d (%+18.16f, %+18.16f)  %+18.16f\n',k,  a, b, m);
      if (abs(a - b) <= tol); break; end 
        if sign(f(m)) == sign(f(b))
          b = m;
        else
          a = m;
        end
     k = k + 1;
    end  % end while loop 
 fprintf('\n root = %20.16f sqrt(2) = %20.16f \n', m, sqrt(2.0));
 
end % end of example_bisection_01