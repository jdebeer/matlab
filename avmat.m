function average = avmat(mat)

mat = input('please input a matrix: ');
[ r, c] = size(mat);
sum = 0;

for i = 1:r
    for j = 1:c
        sum = sum + mat(i,j);
    end
end

average = sum/(r*c);

end