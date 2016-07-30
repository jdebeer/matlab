%script reads a list of phone numbers and then displays them in an
%alternative format

fileid = fopen('phonenos.dat');

if fileid == -1
    disp('File open not successful')
else
    scan = textscan(fileid,'%f');
    closeresult = fclose(fileid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end


str = num2str(scan{1})';
fprintf('%c%c%c-%c%c%c-%c%c%c%c\n',str)