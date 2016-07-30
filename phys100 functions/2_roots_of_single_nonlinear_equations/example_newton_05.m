function example_newton_05(tol)  

  if nargin < 1; tol = 1.0e2*eps; end

  g = @(x) sign(x -2.0).*sqrt(abs(x - 2.0));
  dg = @(x) g(x)./(2.0*(x - 2.0)); 
  a  =  0.0; 
  b  = +4.0;
  x  = linspace(a, b, 1000); 
  plot(x, g(x));
  axis([0, +4.0, -2.0 +2.0])
  grid on; 
  title( ['\fontsize{14}','example\_newton\_05.m']);
  xlabel(['\fontsize{14}','x']); 
  ylabel(['\fontsize{14}','g(x)']); 
  text(0.5, 1.0, 'g(x) = sign(x - 2)(|x - 2|)^{0.5}', 'fontsize', 14);
  x0        = 3.0;
  fprintf('example_newton_05.m:  x0 = %+4.3f\n', x0);
  [m, iter] = newton(g, dg, x0, tol);
  fprintf('at m = %+20.12e iter = %3.0d  f(m) = %+12.6e\n', m, iter, g(m)); 
  hold on; 
  plot(m, g(m),'r+', 'markersize', 20); 
  hold off;