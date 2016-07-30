%script reads data from a file and sums the numbers

fileid = fopen('letspacereal.dat');

if fileid == -1
    disp('File open not successful')
else
    scan = textscan(fileid,'%c %f');
    closeresult = fclose(fileid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end


total = sum(scan{2});

fprintf('The sum of the number is: %.2f\n',total)