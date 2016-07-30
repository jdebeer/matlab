function mat = strs2mat( str1, str2 )

%strs2mat accepts two strings and returns a character matrix with two
%strings in separate rows

n = abs((length(str1) - length(str2)));

if (ischar(str1) && ischar(str2)) && ((length(str1) > length(str2)) || (length(str1) == length(str2)))
   st2 = [str2 blanks(n) ];
   mat = [str1; st2 ];
   
elseif (ischar(str1) && ischar(str2))
    
    st1 = [str1 blanks(n) ];
    mat = [st1; str2];
    
else
    disp('these are not strings')
    
end


end

