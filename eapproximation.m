%eapproximation, this script loops through values of n until the difference
%between the approximation and the actual value is less than 0.0001

n = 0;

while 0.0001 < abs(((exp(-1)) - (1-(1/n))^n)) 
    
    n = n + 1;
    
end

fprintf('the value of e^-1 is %d \nthe approximate value is %d \nthe required value of n for such an approximation is %.0f \n', exp(-1), (1-(1/n))^n, n);
    