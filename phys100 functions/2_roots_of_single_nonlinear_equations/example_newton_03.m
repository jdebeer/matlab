function example_newton_03(tol)  

  if nargin < 1; tol = 1.0e2*eps; end

  g  = @(x) (log(1.0 + x) - cos(x)); 
  dg  = @(x) sin(x) + 1.0./(x + 1);
  a   = 0.0; 
  b   = 1.5;
  x   = linspace(a, b, 1000); 
  plot(x, g(x));
  axis([0.0 1.5, -1.0 +1.0])
  grid on; 
  title( ['\fontsize{14}','example\_newton\_03.m']);
  xlabel(['\fontsize{14}','x']); 
  ylabel(['\fontsize{14}','g(x)']); 
  text(0.05, 0.5, 'f(x) = ln(1 + x) - cosx', 'fontsize', 14);
  x0        = 1.5;
  fprintf('example_newton_03.m:  x0 = %+4.3f\n', x0);
  [m, iter] = newton(g, dg, x0, tol);
  fprintf('at m = %+20.12e iter = %3.0d  f(m) = %+12.6e\n', m, iter, g(m)); 
  hold on; 
  plot(m, g(m),'r+', 'markersize', 20); 
  hold off;