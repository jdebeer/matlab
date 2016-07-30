function [cx cy] = circle_point(a1x,a2x,a3x,a1y,a2y,a3y)

% this function finds the equation of line
% between two points, the midpoint of those two points
% and the equation of the line running perpendicular to
% that line and intersecting that midpoint
% the program will do that between points a1 and a2, 
% a2 and a3 and will look at the
% the point at which the perp. bisectors intersect for
% the center-point, a

% does not work if points are all in line with each other
% because their perpendicular bisectors cannot intersect

    function [a b] = perpline(x1,y1,x2,y2)
          % find the equation of a line runnin perpendicularly
          % through the midpoint of two sets of coordinates
          mx = (x1 + x2)/2;
          my = (y1 + y2)/2;        
          areg = (y2 - y1)/(x2 - x1);
          a = -1/areg;
          b = my - a*mx;  
          if(areg == 0)
              a = 'x_only';
              b = mx;
          end
    end

    [a1 b1] = perpline(a1x,a1y,a2x,a2y);
    
    [a2 b2] = perpline(a2x,a2y,a3x,a3y);
    
    if (strcmp(a1,'x_only') || strcmp(a2,'x_only'))
        if (strcmp(a1,'x_only'))
            cx = b1;
            cy = a2 * cx + b2;
        end
        if (strcmp(a2,'x_only'))
            cx = b2;
            cy = a1 * cx + b1;
        end        
    else
        cx = (b2 - b1)*(a1 - a2)^-1;
        cy = a1*cx + b1;
    end
    
end