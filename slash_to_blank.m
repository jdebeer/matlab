function slash_to_blank(slashstring)

%slash_to_blank recieves a string in which the words are separated by
%slashes and replaces the slashes with spaces

slashstring = strrep(slashstring, '/', ' ');

sprintf('%c',slashstring)

end