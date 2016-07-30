function example_rkf_1 
   
   du_dt      = @(t, y) -2*t*y^2; 
   exact      = @(t)1./(1 + t.^2); 
   tol8       =  1.0e-08; 
   [t8, y8]   = rkf(du_dt, [0, 1], 1, tol8);
   tol10      = 1.0e-10;
   [t10, y10] = rkf(du_dt, [0,1], 1, tol10);
   tol12      = 1.0e-12;
   [t12, y12] = rkf(du_dt, [0, 1], 1, tol12 );

   disp([num2str(tol8), '   No. of calls = ',num2str(length(t8))]);
   disp([num2str(tol10), '   No. of calls = ',num2str(length(t10))]);
   disp([num2str(tol12), '   No. of calls = ',num2str(length(t12))]);
   
   semilogy(t8, abs(y8 - exact(t8)), 'k', t10, abs(y10 -exact(t10)), 'b', ...
            t12, abs(y12 - exact(t12)), 'r', 'LineWidth', 2);  
        
   xlabel('t'); ylabel('|y(t) - exact(t)|'); 
   text(0.2, 1.0e-07,'dy/dt = -2t^{2}'); 
   hold off; 
   legend(strcat('tol = ',num2str(tol8)), ...
          strcat('tol = ',num2str(tol10)), ...
          strcat('tol = ',num2str(tol12)));
   title('example\_rkf\_1.m')
  