  function [ ] = cannon_shell_events
% Initial Value Ordinary Differential Equation 
% Supply initial speed, v0, and maximum flight time 

   v0      = 1000.0;
   tmax    = 200.0;
   angles  = [15 30 45 60 75];   % in degrees 
   color   = [ 'b'; 'g'; 'r'; 'm'; 'k']; 
   radian  = 180/pi; 
   angles  = angles./radian; 

   hold on;  
     for k = 1:length(angles) 
       initial = [0; 0; v0*cos(angles(1,k)); v0*sin(angles(1,k))]; 
       options = odeset('RelTol', 1.0e-10, 'AbsTol', 1.0e-10,'Events', @ground); 
       [t  s, te, se, ie]  = ode45(@projectile, [0, tmax], initial, options); 
       fprintf('time of impact = %5.2f at x = %7.2f and y = %7.2e\n', te, se(1:2));
       % s      = [x;y;ux;uy] 
       x        = s(:,1); 
	   y        = s(:,2); 
       plot(x, y, color(k), 'LineWidth', 2); 
       ylim([0.0, 30000.0])
     end 
   xlabel(' X [m]');ylabel(' Y [m]'); 
   title(strcat('Cannon Shell Motion: v_o = ', num2str(v0),' m/s' ));  
   legend(num2str((180.0*angles/pi)'));  
   hold off; 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function du_dt = projectile(t, u) 
 %  u    = [x  y  ux     uy]'
 % du_dt = [ux uy dux/dt duy/dt]'
 x = u(1); y = u(2); vx = u(3); vy = u(4); 
 % Quadratic velocity dependent drag 
 g           = -9.8;
 B2          = 4.0e-05;
 v           = sqrt(vx^2 + vy^2); 
 drag        =  B2*v*v;
 % atmospheric density fall off with height 
 drag        = drag*exp(-y/1.0e04);
 du_dt(1,1)  = vx; 
 du_dt(2,1)  = vy; 
 v           = sqrt(vx*vx + vy*vy);
 drag        =  B2*v*v;
 du_dt(3,1)  =   -(vx/v)*drag;
 du_dt(4,1)  = g -(vy/v)*drag;

 
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 function [value, isterminal, direction] = ground(t, y)
       value      = y(2); 
       isterminal = [1];
       direction  = [-1];


