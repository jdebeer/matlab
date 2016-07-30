load hw3datafile.dat

[ r, c] = size(hw3datafile);

for i = 1:r
    figure(i)
    plot(hw3datafile(i,:))
    
end