function  example_bisection_02A(tol)

  if nargin < 1; tol = 1.0e2*eps; end

  f  = @(x) (x - 1.0).^9;
  a  = -0.412; 
  b  = +2.199; 
  x  = linspace(a, b, 1000); 
  plot(x, f(x));
  axis([0.0 2.0, -1.0 +1.0])
  grid on; 
  title( ['\fontsize{14}','example\_bisection\_02A.m']);
  xlabel(['\fontsize{14}','x']); 
  ylabel(['\fontsize{14}','f(x)']); 
  text(0.05, 0.5, 'f(x) = (x - 1)^9', 'fontsize', 14);
  [m, iter] = bisect(f, [a b], tol);
  fprintf('at m = %+20.12e iter = %3.0d  f(m) = %+12.6e\n', m, iter, f(m)); 
  hold on; 
  plot(m, f(m),'r+', 'markersize', 20); 
  hold off;
end % end of function example_bsection_02A 

