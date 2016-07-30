function euler_stability

   df_dt      = @(t ,u) -0.5*u;
   tspan      = [0 20];
   h1         = 1.0; h2 = 4.2;  
   n1         = round( (tspan(2) - tspan(1))/h1 );
   n2         = round( (tspan(2) - tspan(1))/h2 );
  
   [t1, y1]   = euler(df_dt, tspan, 1, n1);
   [t2, y2]   = euler(df_dt, tspan, 1, n2);

   
   plot(t1, y1, 'ko-', t2, y2, 'bs-','LineWidth',2)
   axis([0, 20, -2 2]); 
   xlabel('t'); ylabel('y(t)'); 
   text(2.0, 1.5,'dy/dt = -0.5y', 'FontSize',18); 
   label1 = strcat('h = ', num2str(h1));
   label2 = strcat('h = ', num2str(h2)); 

   legend(label1, label2); 
   title ('euler\_stability.m', 'FontSize', 18); 
 