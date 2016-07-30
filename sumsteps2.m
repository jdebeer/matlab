function sum = sumsteps2(n)

sum = 0;

for i = 1:n
    if i/2 ~= int32(i/2)
    sum = sum + i;
    end
end

   