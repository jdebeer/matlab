function [c1x c1y] = center_point(a1x,a1y,a2y,a3y,b1x,b2x,b3x,b1y,b2y,b3y,cx,cy)

%triangle A3-B3-C* is congruent to triangle A1-B1-C3
%use this fact to get the coordinates of C3

B1A1 = sqrt((b1x-a1x)^2 + (b1y-a1y)^2);

%get the rotation
theta = -(acos((a1y-b1y)/(B1A1))-acos((a3y - b3y)/(B1A1)));
%get the translation
b3t = [cos(theta), -sin(theta);sin(theta),cos(theta)]*[b3x;b3y];
b3xt = b3t(1);
b3yt = b3t(2);
%apply rotation and translation to c*
c3 = [cos(theta), -sin(theta);sin(theta),cos(theta)]*[cx;cy]-[b3xt-b1x;b3yt-b1y];
c3x = c3(1);
c3y = c3(2);



%triangle A2-B2-C* is congruent to triangle A1-B1-C2
%use this fact to get the coordinates of C2


%get the rotation
alpha = -(acos((a1y-b1y)/(B1A1))-acos((a2y - b2y)/(B1A1)));
%get the translation
b2t = [cos(alpha), -sin(alpha);sin(alpha),cos(alpha)]*[b2x;b2y];
b2xt = b2t(1);
b2yt = b2t(2);
%apply rotation and translation to c*
c2 = [cos(alpha), -sin(alpha);sin(alpha),cos(alpha)]*[cx;cy]-[b2xt-b1x;b2yt-b1y];
c2x = c2(1);
c2y = c2(2);



%call function circle_point to find the circle point from
%the coordinate pairs from C2, C3, and C*

[c1x c1y] = circle_point(c2x,c3x,cx,c2y,c3y,cy);

    
end