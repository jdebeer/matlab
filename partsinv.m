%this script reads data that is stored as a matrix in a file.  The dollar
%worth of the inventory is found and displayed

fileid = fopen('parts_inv.dat');
if fileid == -1
    disp('File open was not successful')
else
    mat = fscanf(fileid,'%f %f %f', [3 inf]);
    closeresult = fclose(fileid);
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end

mat = mat';
Value = sum(mat(:,2).*mat(:,3));
fprintf('Total dollar amount of inventory: $%.2f\n',Value)