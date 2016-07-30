%this reads the data from a file, manipulates the numbers and writes a new
%matrix

matrix = [];

fileid = fopen('mm.dat');

if fileid == -1
    disp('File open not successful')
else
    while ~feof(fileid)
        str = fgetl(fileid);
        [x str] = strtok(str,',');
        x = str2num(x(2:end));
        [y str] = strtok(str,',');
        y = str2num(y);
        [z str] = strtok(str,',');
        z = str2num(z(1:end-1));
        matrix = [matrix;x,y,z];
    end
    
    closeresult = fclose(fileid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end


save newmm.dat matrix -ascii