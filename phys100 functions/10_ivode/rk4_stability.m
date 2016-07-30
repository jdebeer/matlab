function rk4_stability

   df_dt      = @(t, y) -5*t*y^2 +5/t - 1/t^2;
   tspan      = [1, 20]; 
   h1         = 0.32; h2 = 0.34; h3 = 0.36;
   n1         = round( (tspan(2) - tspan(1))/h1 );
   n2         = round( (tspan(2) - tspan(1))/h2 );
   n3         = round( (tspan(2) - tspan(1))/h3 );

   [t4, y4]   = rk4(df_dt, tspan, 1, n1);
   [t8, y8]   = rk4(df_dt, tspan, 1, n2);
   [t16, y16] = rk4(df_dt, tspan, 1, n3);
   
   plot(t4, y4, 'g', t8, y8, 'b', t16, y16, 'r', 'LineWidth',2);
   xlabel('t'); ylabel('y(t)'); 
   text(2, 0.8,'dy/dt = -5ty^2 + 5/t-1/t^2', 'FontSize',14); 
   text(2, 0.7,'\lambda_{effective} = 10', 'FontSize',14); 
   label1 = strcat('h = ', num2str(h1));
   label2 = strcat('h = ', num2str(h2)); 
   label3 = strcat('h = ', num2str(h3));
   legend(label1, label2, label3); 
    title('rk4\_stability.m', 'FontSize',14);