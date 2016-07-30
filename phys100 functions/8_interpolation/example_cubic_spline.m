function example_cubic_spline 

xd = [0 1 2 3 4 5]; yd = [3 1 4 1 2 0];
xx = linspace(0.01, 4.99, 250);
yyC = natural_spline(xd, yd, xx);
figure(7);plot(xx, yyC, 'k', xd, yd,'r+','MarkerSize',12, 'LineWidth', 1);
xlabel('x', 'FontSize',12);
ylabel('y(x)', 'FontSize',12);
title('cubic\_spline.m','FontSize',12);
text(3.5,3.5,'natural spline', 'FontSize', 12);