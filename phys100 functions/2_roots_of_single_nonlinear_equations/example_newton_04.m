function example_newton_04(tol)  

  if nargin < 1; tol = 1.0e2*eps; end

  g = @(x) x.*(1.0 - cos(x)); 
  dg = @(x) (x*sin(x) - cos(x) + 1);
  a  = -3.5; 
  b  = +4.85;
  x  = linspace(a, b, 1000); 
  plot(x, g(x));
  axis([-2.5, +2.5, -2.0 +2.0])
  grid on; 
  title( ['\fontsize{14}','example\_newton\_04.m']);
  xlabel(['\fontsize{14}','x']); 
  ylabel(['\fontsize{14}','g(x)']); 
  text(-2.0, 1.0, 'g(x) = x(1 - cosx)', 'fontsize', 14);
  x0        = 2.5;
  fprintf('example_newton_04.m:  x0 = %+4.3f\n', x0);
  [m, iter] = newton(g, dg, x0, tol);
  [m, iter] = bisect(g, [a b], tol);
  fprintf('at m = %+20.12e iter = %3.0d  f(m) = %+12.6e\n', m, iter, g(m)); 
  hold on; 
  plot(m, g(m),'r+', 'markersize', 20); 
  hold off;