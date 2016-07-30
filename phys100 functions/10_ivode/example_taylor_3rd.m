function example_taylor_3rd

y0      = 1; 
initial = 0.0;
final   = 1.0;
N       = 25;

[t, y] = taylor_3rd(@f, @ft, @ftt, [initial, final], y0, N); 
subplot(1, 2,1),plot(t, y, 'r', 'LineWidth',2); 
title('Taylor Series 3^{rd} Order', 'FontSize', 14);
xlabel('t'); ylabel('y(t)');
subplot(1, 2, 2), plot(t, abs(y - exact(t)),'LineWidth',2);
xlabel('t'); ylabel('|y(t) - exact(t)|');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dy_dt = f(t, y)
    dy_dt = -2*t*y^2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function r = ft(t, y)
  %y'' = ft + f*fy 
    f    = -2*t*y^2; 
    ft   = -2*y^2;
    fy   = -4*t*y;
    r    = ft +fy*f;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function r = ftt(t, y)
% y''' = ftt + 2ftyf + fyy*f^2 + fy(ft + fyf)
    f    = -2*t*y^2; 
    ft   = -2*y^2;
    ftt  = 0 ;
    fty  = -4*y; 
    fy   = -4*t*y;
    fyy  = -4*t;

r = ftt +2*fty*f + fyy*f^2 + fy*(ft + fy*f); 

  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function r = exact(t)
   r = 1./(1 + t.^2); 