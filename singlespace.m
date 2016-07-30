function singlespace(spacestring)

%singlespace receives a string and deletes all excessive blanks.
%Excessive blanks are ones that follow the first blank between words

%returns the string with blanks removed


spacelocvec = strfind(spacestring, ' ');

i = 1;

strlen = length(spacelocvec);


for i = 1:(strlen - 1)
    
    if (spacelocvec(i) == (spacelocvec(i+1) - 1)) 
        
       spacestring(spacelocvec(i+1)) = '/';
       
       
    end
    
    i = i + 1;
    
end

newstring = strrep(spacestring,'/','');

sprintf('%c',newstring)

end
       
       