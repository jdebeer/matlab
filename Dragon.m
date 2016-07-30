function [ du_dt ] = Dragon(t, u)
 
 %this is a function for drag
 
x = u(1);
y = u(2);
vx = u(3);
vy = u(4);
 
v = sqrt(vx^2 +vy^2);
h = 10*1000;
Cd = 4.0e-05*exp(-y/h);
 
 
 
du_dt = [u(3); u(4); (-Cd*vx*v); (-9.8-Cd*vy*v)]; 
 
end