function order = ordered(x)

%this function accepts an integer vector x and ascertains if the vector
%elements are in ascending or descending order.


if x == sort(x)
    
    disp('The vector entered is in ascending order.')
    
elseif  x == sort(x,'descend')
    
    disp('The vector entered is in descending order.')
    
else
    disp('This vector is not ordered.') 
  
end
end