function ascstrings = buildstr(charp,num)

%buildstr accepts a character and integer in the form buildstr('char',int)
%it returns a cell array with strings of increasing length, from 1 to int
%it builds strings with successive characters in the ASCII encoding


if (int32(num) == num) && ischar(charp)
           
    charnum = double(charp);
    ascstrings = cell(1,num);
    ascstrings{1,1} = charp;
   
    for i = 2:num
        newchar = char(charnum + i - 1 );
        ascstrings{1,i} = [ascstrings{i-1} newchar ];
        
    end
    
else
    fprintf('Please make sure to enter an integer and character n\')
    
end
end
        
        
    