function euler_stability_1
   tspan      = [1 10];
   h1         = 0.19; h2 = 0.21; h3 = 0.25;
   n1         = round( (tspan(2) - tspan(1))/h1 );
   n2         = round( (tspan(2) - tspan(1))/h2 );
   n3         = round( (tspan(2) - tspan(1))/h3 );
  
   df_dt      = @(t, u) -5.0*t*u^2 + 5/t -1/t^2;
   [t1, y1]   = euler(df_dt, [1, 10], 1, n1);
   [t2, y2]   = euler(df_dt, [1, 10], 1, n2);
   [t3, y3]   = euler(df_dt, [1, 10], 1, n3);
   
   plot(t1, y1, 'k', t2, y2, 'g', t3, y3, 'r', 'LineWidth',2)
   
   xlabel('t'); ylabel('y(t)'); 
   text(2.0, 1.1,'dy/dt = -5ty^2 + 5/t-1/t^2', 'FontSize',12); 
   text(2.0, 0.9,'\lambda_{effective} = 10', 'FontSize',12); 
   label1 = strcat('h = ', num2str(h1));
   label2 = strcat('h = ', num2str(h2)); 
   label3 = strcat('h = ', num2str(h3));
   
   legend(label1, label2, label3, 'Location', 'EastOutside'); 
   title ('euler\_stability\_1.m', 'FontSize',16)