function vector = createvecMToN(m,n)

%this function creates a vector that spans the dimensions m through n
%if m == n, then a scalar of dimension m is returned
if m ~= n
    m:1:n
else 
    vector = [m];
    
end