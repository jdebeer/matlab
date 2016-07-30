% This script reads a text file and evaluates the expression on each line

fileid = fopen('mathfile.dat');
if fileid == -1
    disp('File open not successful')
else
    while ~feof(fileid)
        str = fgetl(fileid);
        result = eval(str);
        x = str2num(str(1));
        operator = str(2);
        y = str2num(str(3));
        fprintf('%d %c %d = %d\n',x,operator,y,result)
    end
    
    closeresult = fclose(fileid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end