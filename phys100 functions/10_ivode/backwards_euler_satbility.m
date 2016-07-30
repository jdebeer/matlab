function backwards_euler_satbility

   tspan      = [1 10];
   h1         = 0.19; h2 = 0.21; h3 = 0.25;
   n1         = round( (tspan(2) - tspan(1))/h1 );
   n2         = round( (tspan(2) - tspan(1))/h2 );
   n3         = round( (tspan(2) - tspan(1))/h3 );

   df_dt      = @(t, u) -5.0*t*u^2 + 5/t -1/t^2;
   [t1, y1]   = backwards_euler(df_dt, tspan, 1, n1);
   [t2, y2]   = backwards_euler(df_dt, tspan, 1, n2);
   [t3, y3]   = backwards_euler(df_dt, tspan, 1, n3);
   
   plot(t1, y1, 'k', t2, y2, 'g', t3, y3, 'r', 'LineWidth',2)
   axis([0, 10, -0.2, 1.205]); 
   
   xlabel('t'); ylabel('y(t)'); 
   text(2.0, 1.1,'dy/dt = -5ty^2 + 5/t-1/t^2', 'FontSize',12); 
   label1 = strcat('h = ', num2str(h1));
   label2 = strcat('h = ', num2str(h2)); 
   label3 = strcat('h = ', num2str(h3));
   
   legend(label1, label2, label3, 'Location', 'Northeast'); 
   title ('backwards\_euler\_stability.m');