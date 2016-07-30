%elistud is a script that stores student information and ultimately
%determines eligable students based on heights or weights;  eligable
%students have a height or weight below the average height/weight


subjects(3) = struct('name','Joey','sub_id',111,'height',6.7000,'weight',222.2000);
subjects(2) = struct('name','Neel','sub_id',110,'height',5.9000,'weight',160.2000);
subjects(1) = struct('name','Tom','sub_id',109,'height',5.1000,'weight',115.0000);

avgway = 0;
avghi = 0;

for j = 1:length(subjects)
    avgway = avgway + subjects(j).weight;
    avghi = avghi + subjects(j).height;
    j = j + 1;
end


avheight = avghi/length(subjects);
avweight = avgway/length(subjects);


for i = 1:length(subjects)
    
    if (subjects(i).height < avheight) || (subjects(i).weight < avweight)
        disp(subjects(i).name)
    end
end
        
        
        