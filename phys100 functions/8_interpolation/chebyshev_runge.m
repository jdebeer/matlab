function di = chebyshev_runge(nd)

runge = @(t) 1.0./(1 + 25.0*t.^2); 
xd    = chebyshev_nodes(-1.0, +1.0, nd); 
yd    = runge(xd);
xx    = linspace(-1, +1, 500)';
yy    = interp_lagrange(xd, yd,  xx);
plot(xx, runge(xx), 'k', xx, yy, 'r', xd, yd, 'b+', 'LineWidth', 1)
xlabel('x', 'FontSize', 12);
ylabel('y(x)', 'FontSize', 12);
title('Polynomial Interpolation for Runge Function', 'FontSize', 12);
text(-0.95, 0.95, ['Chebyshev Points: n_{d} = ',num2str(nd)], 'FontSize', 10);
di    = max(abs(yy - runge(xx)));
text(-0.95, 0.9, ['Maximum difference = ',num2str(di)], 'FontSize', 10);
end

