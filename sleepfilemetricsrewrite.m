clear mat

fid = fopen('metricssleep');
count = 0;
if fid == -1
    disp('File open not successful')
else
    mat = fscanf(fid, '%f%f%f%f%f%f\n%f%f%f%f%f%f\n%f%f%f%f%f%f\n%f%f%f%f%f%f\n%f%f%f%f%f\n', [34 inf]);
        
    mat = mat';
    
    xlswrite('sleepdat',mat);
  
    closeresult = fclose(fid)
    if closeresult == 0
        disp('File close successful')
    else
        disp('File close not successful')
    end
end