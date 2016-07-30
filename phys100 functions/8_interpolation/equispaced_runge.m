function equispaced_runge

runge = @(t) 1.0./(1 + 25.0*t.^2); 

xd5  = linspace(-1, 1, 5);    yd5  = runge(xd5);
xd10 = linspace(-1, 1, 10);   yd10 = runge(xd10);
xd15 = linspace(-1, 1, 15);   yd15 = runge(xd15);
xx   = linspace(-1, +1, 250);
yy5  = interp_newton(xd5, yd5,  xx);
yy10 = interp_newton(xd10, yd10,  xx);
yy15 = interp_newton(xd15, yd15,  xx);
plot(xx, yy5, 'r', xx, yy10, 'g', xx, yy15, 'm', 'LineWidth', 1)
legend('5 pts', '10 pts', '15 pts')
hold on;
plot(xd5, yd5, 'r+', xd10, yd10, 'g+', xd15, yd15, 'k+');
xlabel('x', 'FontSize', 12);
ylabel('y(x)', 'FontSize', 12);
title('Polynomial Interpolation for Runge Function', 'FontSize', 12);
text(-0.45, 7.0, 'Equispaced Data Points', 'FontSize', 12);

