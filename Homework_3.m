%Homework 3

%Problem 1, 4.2

function sum = sumsteps2(n)

sum = 0;

for i = 1:n
    if i/2 ~= int32(i/2)
    sum = sum + i;
    end
end

%Problem 2, 4.7

% this is a script that generates a random integer from 2 to 5 and then
% uses that as the looping number.  the loop prompts the user the number
% and displays a cumulative sum of the entered number and previously
% entered numbers

sumnum = 0;
r = randi([2,5],1);


for i = 1:r
    
    number = input('Please enter a number: ');
    
    sumnum = sumnum + number;
    
    fprintf('The sum of the numbers entered thus far is %.1f.\n', sumnum')
    
end


%Problem 3, 4.9  

%%%Question: what does figure(i) have to be included?

load hw3datafile.dat

[ r, c] = size(hw3datafile);

for i = 1:r
    figure(i)
    plot(hw3datafile(i,:))
    
end

%Problem 4, 4.14

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

%Problem 5, 4.15

mat = [ 1 2 4; 3 4 4; 4 4 4]

mat =

     1     2     4
     3     4     4
     4     4     4

prod(mat)

ans =

    12    32    64

prod(mat')

ans =

     8    48    64

%Problem 6, 4.18

mat = input('please input mat: ');

[ row col] = size(mat);
for i = 1:row
    fprintf('The product of row %d is %d\n',i, prod(mat(i,:),2));
end


%Problem 7, 4.23

%eapproximation, this script loops through values of n until the difference
%between the approximation and the actual value is less than 0.0001

n = 0;

while 0.0001 < abs(((exp(-1)) - (1-(1/n))^n)) 
    
    n = n + 1;
    
end

fprintf('the value of e^-1 is %d \nthe approximate value is %d \nthe required value of n for such an approximation is %.0f \n', exp(-1), (1-(1/n))^n, n);

%Problem 8, 4.28

% Carnot Efficiency

hotabst = input('Enter the absolute tempurature of the hot reservoir: ');
coldabst = input('Enter the absoulate tempurature of the cold reservoir: ');

carneff = 1 - (hotabst/coldabst);

if hotabst < coldabst
    temp = coldabst;
    coldabst = hotabst;
    hotabst = temp;
end
    

fprintf('The Carnot efficiency of this heat engine is %.3f \n',carneff);
