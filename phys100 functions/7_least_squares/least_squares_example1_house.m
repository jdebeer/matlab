function beta = least_squares_example1_house

   t      = [-1.0 -0.5 0.0 0.5 1.0]';
   y      = [1.0   0.5 0.0 0.5 2.0]';
   X      = [ones(size(t)) t   t.^2];
   beta   = house_least_squares_sol(X, y);  
   tt     = linspace(min(t), max(t), 250); 
   yy     = @(t) (beta(1) + beta(2)*t + beta(3)*t.^2); 
   plot(t, y, 'ro', tt, yy(tt), 'MarkerSize', 6, 'MarkerFaceColor',...
       'r', 'LineWidth', 2); 
   fs = 12;  xlabel('t','FontSize', fs); ylabel('y(t)', 'FontSize', fs); 
   title('least\_squares\_example\_1\_house.m', 'FontSize', fs); 
