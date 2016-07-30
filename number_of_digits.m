function integer = number_of_digits(n)


% thi function accepts a non-negative integer and determines the number of
% digits that constitute the integer with a while loop

i = 1;

if (int32(n) ~= n) || (n < 0)
    
    fprintf('%f is not a non-negative integer; this function only accepts non-negative integers. \n', n)
    
else
    
    while (10^i - n) < 0 || n == 10^i
       
        i = i + 1;
        
    end
    
    fprintf('The integer %.0f has %.0f digits. \n',n,i)
    
end
end