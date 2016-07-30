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