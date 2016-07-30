function example_rk4

   [t4, y4]   = rk4(@df_dt, [0, 1], 1, 4);
   [t8, y8]   = rk4(@df_dt, [0, 1], 1, 8);
   [t16, y16] = rk4(@df_dt, [0, 1], 1, 16);
   [t32, y32] = rk4(@df_dt, [0, 1], 1, 32);
   [t64, y64] = rk4(@df_dt, [0, 1], 1, 64);
   hold on; 
   subplot(2, 1, 1), plot(t4, y4, 'k', t8, y8, 'b', t16, y16, 'r', ...
                          t32, y32, 'g', t64, y64, 'm');
   xlabel('t'); ylabel('y(t)'); 
   text(0.2, 0.8,'dy/dt = -2ty^{2}'); 
   hold off; 
   legend('N=  4', 'N=  8', 'N= 16', 'N= 32', 'N= 64'); 
   title ('RK4 Example'); 
   subplot(2, 1, 2), semilogy(t4, abs(exact(t4) - y4), 'k', t8, abs(exact(t8) - y8), 'b', ...
                       t16, abs(exact(t16) - y16), 'r', t32, abs(exact(t32) - y32), 'g', ...
                       t64, abs(exact(t64) - y64));
   xlabel('t'); ylabel('|exact(t) - y(t)|'); 
   hold off; 
   legend('N=  4', 'N=  8', 'N= 16', 'N= 32', 'N= 64'); 
   title ('RK4 Example'); 
   
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 function dy_dt = df_dt(t, y)
      dy_dt = -2*t*y^2; 
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 function r = exact(t)
   r = 1./(1 + t.^2); 