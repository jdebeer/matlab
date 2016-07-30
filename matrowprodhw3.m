mat = input('please input mat: ');

[ row col] = size(mat);
for i = 1:row
    fprintf('The product of row %d is %d\n',i, prod(mat(i,:),2));
end
