function F = nonlinear_gauss2(x) 
    x1 = x(1);
    x2 = x(2); 
    A1 = x(3);
    A2 = x(4); 
    F = [(A1      + A2 -2.0); 
         (A1*x1   + A2*x2);
         (A1*x1^2 + A2*x2^2 -2/3); 
         (A1*x1^3 + A2*x2^3)]; 
