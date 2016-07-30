function rectvect = recta(nodes)

%this is a function that receives an input array, nodes, the x and y 
%coordinates of four points. the coordinates of the points should are 
%identified in clockwise order, starting from the upper left point


%if the vectors entered form a square, the function identifies them as
%rectangular all the same

top = (nodes(1,1) - nodes(1,2));
bottom = (nodes(1,3) - nodes(1,4));
left = (nodes(2,1) - nodes(2,3));
right = (nodes(2,2) - nodes(2,4));

lowleftang = abs(atand(right/bottom) + atand(top/left));

if (top ~= bottom) && (left ~= right)
    fprintf('Sorry, the coordinates you entered do not form a rectangle \n')
    
elseif lowleftang ~= 90
    fprintf('Sorry, the coordinates you entered do not form a rectangle \n')
        
else
    fprintf('The coordinates you entered form a rectangle. \n')
    
end
end