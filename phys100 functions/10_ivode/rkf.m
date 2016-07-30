function  [t_out, y_out] = rkf(f, tspan, y0, tol)
%function [t_out, y_out] = rkf(f, tspan, y0, tol)
% runge-kutta-fehlberg algorithm 5.3
% System of ODEs identified via length of y0
% INPUT: 
%         f       = name of function 
%                   f MUST be a 'string' OR function handle  
%         tspan   = [tmin, tmax], range of times 
%         y0      = initial independent value 
%         n       = number of steps 
% OUTPUT: 
%         t_out   = corresponding t 
%                 size(t)  => [n, 1]
%         y_out   = final values 
%                 size(y)  => [n, m]
% Numerical Analysis, 7th Ed. (2001) R L Burden & J D Faires
% [Brook-Cole: Pacific Grove, CA] 
% MODIFICATION of runge-kutta-fehlberg algorithm 5.3

 initial = tspan(1);
 final   = tspan(2);    
 hmax    = final - initial; 
 hmin    = hmax/100000; 
 
% step 1
 h     = hmax;
 t     = initial;  
 t_out = [t]; 
 w     = y0;
 y_out = [w']; 
 ok    = 1; 
 
% step 2
   while t < final & ok 
   % step 3
    k1 = h*f( t, w);
    k2 = h*f( t+h/4,w+k1/4);
    k3 = h*f( t+3*h/8,w+(3*k1+9*k2)/32);
    k4 = h*f( t+12*h/13,w+(1932*k1-7200*k2+7296*k3)/2197);
    k5 = h*f( t+h,w+439*k1/216-8*k2+3680*k3/513-845*k4/4104);
    k6 = h*f( t+h/2,w-8*k1/27+2*k2-3544*k3/2565+1859*k4/4104-11*k5/40);
% step 4
     r = norm(abs(k1/360-128*k3/4275-2197*k4/75240.0+k5/50+2*k6/55)/h, 2); 
% step 5
         if r <= tol 
           % step 6
           % approximation accepted
           t     = t + h; 
           t_out = [t_out; t]; 
           w     = w+25*k1/216+1408*k3/2565+2197*k4/4104-k5/5;
           y_out = [y_out; w']; 
           % step 7
           % fprintf(oup, '%12.7f %11.7f %11.7f %11.7f\n', t, w, h, r);
         end
% step 8
% to avoid underflow
         if r > 1.0e-20 
           delta = 0.84 * exp(0.25 * log(tol / r));
         else
           delta = 10.0;
         end  
% step 9
% calculate new h
         if delta <= 0.1 
           h = 0.1*h;
         else
           if delta >= 4 
              h = 4.0 * h;
           else
              h = delta * h;
           end
         end
% step 10
         if h > hmax; h = hmax; end
% step 11
         if h < hmin 
            ok = 0;
         else
               if t + h > final 
                   if abs(final - t) < tol 
                      t = final;
                   else
                      h = final - t;
                   end
               end
         end
 end
 if ~ok; error('minimal h exceeded\n'); end
