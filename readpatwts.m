%readpatwts opens a file and prints the data into strings in the form
%last,first followed by the weight; it will also calculate and print the
%average weight.  It will also indicate if the file close was successful

tot = 0;
count = 0;

fileid = fopen('patwts.dat');
if fileid == -1
    disp('File open not successful')
else
    while ~feof(fileid)
        str = fgetl(fileid);
        count = count + 1;
        [first str] = strtok(str);
        [last weight] = strtok(str);
        weight = str2num(weight);
        tot = tot + weight;
        fprintf('%s, %s %.1f\n',last,first,weight)
    end
    
    fprintf('the ave weight is %.2f\n',tot / count)
    
    closeresult = fclose(fileid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end