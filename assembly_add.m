function sum = assembly_add(addst)

%assembly_add recieves a string with format 'ADD num1,num2' and adds the
%two numbers before and after the comma



root = 'ADD ';


if ischar(addst) && strcmp(addst(1:4),root) && (length(strfind(addst,',')) == 1)
    
bp = strfind(addst,',');
strlen = length(addst);
num1 = str2num(addst(5:(bp-1)));
num2 = str2num(addst((bp+1):strlen));

sum = num1 + num2;

else
    disp('the string submitted is not in the correct format; correct format is: ''ADD num1,num2''')
    
end
end
