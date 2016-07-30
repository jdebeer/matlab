function [r, k] = example_newton_01

   syms x fs dfs
   fs      = 3*x^4 - 6*x^2 + x*sin(pi*x); % symbolic expression 
   dfs     = diff(fs, x);               % symbolic derivative 
   f       = matlabFunction(fs);       % convert from symbolic to anonymous fn
   df      = matlabFunction(dfs);      % convert from symbolic to anonymous fn
   
   [r1, k1] = newton(f, df, +1.5); 
   [r2, k2] = newton(f, df, -1.5);
   [r3, k3] = newton(f, df, -0.05);
   r        = [r1; r2; r3];
   k        = [k1; k2; k3]; 
   fplot(f, [-1.75, +1.75]);  hold on;
   title('example\_newton\_01.m', 'FontSize', 16); 
   xlabel('x', 'FontSize', 12); 
   ylabel('f(x)', 'FontSize', 12);
   plot(r1, f(r1), 'r+', 'Markersize', 12); 
   plot(r2, f(r2), 'r+', 'Markersize', 12); 
   plot(r3, f(r3), 'r+', 'Markersize', 12); 
   grid on; 
   
end