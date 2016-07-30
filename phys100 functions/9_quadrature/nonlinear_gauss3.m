function F = nonlinear_gauss3(x) 
    x1 = x(1);
    x2 = x(2); 
    x3 = x(3); 
    A1 = x(4);
    A2 = x(5);
    A3 = x(6); 
    F = [(A1      + A2      + A3  -2.0); 
         (A1*x1   + A2*x2   + A3*x3);
         (A1*x1^2 + A2*x2^2 + A3*x3^2 -2/3); 
         (A1*x1^3 + A2*x2^3 + A3*x3^3);
         (A1*x1^4 + A2*x2^4 + A3*x3^4 -2/5);
         (A1*x1^5 + A2*x2^5 + A3*x3^5); ];

