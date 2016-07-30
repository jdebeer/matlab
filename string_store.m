%string_store accepts strings (without quotes) and stores them in a cell 
%array until the user enters 'done' (no quotes), and once the user enters
%'done' displays the contents of the cell array


i = 1;

strings = input('Please enter a string (don''t worry about single quotes):','s');

while strcmp(strings, 'done') == 0



stringstorecell{i} = strings;

strings = input('Please enter a string:','s');

i = i + 1;

end

disp(stringstorecell)

