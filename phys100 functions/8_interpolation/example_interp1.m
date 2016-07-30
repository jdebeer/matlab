   function example_interp1    
   
   xx = linspace(-2, 2, 250);
   xh = [-2 -1.5 -1 -0.5 0 0.5 1 1.5 2]';
   yh = [ 0  0    0  0.87, 1 0.87 0 0 0]';
   a  = newton_coef(xh, yh);
   yf = newton_eval(newton_coef(xh, yh), xh,xx); 
   ys = interp1(xh, yh, xx, 'spline');
   yp = interp1(xh, yh, xx, 'pchip');
   plot(xx, yf, 'b', xx, ys, 'r', xx, yp, 'g', xh, yh, 'k+', 'LineWidth', 2);
   legend('newton interp', 'cubic spline', 'pchip');
   xlabel('x'); ylabel('y(x)'); 
   title('Matlab''s {\it interp1}'); 
