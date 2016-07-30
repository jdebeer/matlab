function divide = isdivby4(num)
%rem is a function that divides the first entry by the second and
%determines its remainder
if rem(num,4) ~= 0
    fprintf('%d is not divisible by 4. \n',num)
else
    fprintf('%d is divisble by 4. %d/4 is equal to %d. \n',num,num,num/4)
    
end