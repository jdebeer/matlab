%Problem 1, 3.1

'b' >= 'c' - 1

ans =

     1
     
%this is b/c 1 means true, and b and c are next to each other
%in ASCII
 
3 == 2 + 1

ans =

     1
     
%this is 1 because 3 and 2+1 are logically equivalent

(3 == 2) + 1

ans =

     1
     
%this is 1 because 3 == 2 is actually false, which returns 0.  0 + 1 = 1

xor(5 < 6, 8 > 4)

ans =

     0
    
%this is 0 because both arguments in the xor function are true,
%and xor only returns 1 (true) if one, and on only 1, of the arguments are
%true

%Problem 2, 3.2

ecs = input('Please enter the ''x'' character: ','s');

if ecs == 'x'
    disp('good job, thanks!')
else
    fprintf('sorry, %c is not what was asked for, please try again.\n',ecs)
    
end

%Problem 3, 3.5

char = input('Please enter a letter from the alphabet, eg a,b,c,...,y,z: ', 's');

if isletter(char) == 1
    fprintf('%c is a letter from the alphabet. nice work buddy.\n', char)
    
else
    fprintf('Ehh, wrong; %c is not a letter from the alphabet, buddy. \n\nPlease try again.\n', char) 
    
end

%Problem 4, 3.7

%Function:

function eccentricity = elecc(a, b)

%this is a function which requires the semi-major/minor axes of an ellipse
%and ruturns the ellipse's eccentricity

eccentricity = sqrt(1 - (b^2)/a);

end

%Script:

%this script retrieves the dimensions of an ellipse so it can call a
%function to calculate the eccentricity of that ellipse and return the
%results


a = input('Please enter the dimension of the semi-major axis: ');
b = input('Please enter the dimension of the semi-minor axis: ');

if a == 0
    fprintf('Sorry, 0 is not an appropriate dimension for the semi-major axis. \n')
else
    disp('the eccentricity is:')
    disp(elecc(a,b));
   
end




%Problem 5, 3.11


function vector = createvecMToN(m,n)

%this function creates a vector that spans the dimensions m through n
%if m == n, then a scalar of dimension m is returned
if m ~= n
    m:1:n
else 
    vector = [m];
    
end


%Problem 6, 3.18

function divide = isdivby4(num)
%rem is a function that divides the first entry by the second and
%determines its remainder.  I'm doing it this way because it's cooler, and
%harder than the way the question asks
if rem(num,4) ~= 0
    fprintf('%d is not divisible by 4. \n',num)
else
    fprintf('%d is divisble by 4. %d/4 is equal to %d. \n',num,num,num/4)
    
end

%Problem 7, 3.19

function intcheck = isint(innum)

if innum == int32(innum)
    disp('1')
    
else
    disp('0')
    
end


%Problem 8, 3.26

height = input('Please enter the height of the clouds, in feet: ');

%this script determines the height region of clouds based on their height
%in feet

if height <= 6500 && height >= 0
   disp('low 0-6500 feet')   
elseif (height > 6500 && height <= 20000)
         disp('middle 6500-20000 feet')
elseif height > 20000
         disp('high >20000 feet')
    
else
     disp('this height is out of range');
        
end



%Problem 9, 3.36

%this statement would be the same without the else clause, so to simplify
%the statement the else clause can be removed.

if num < 0
    num = abs(num);

end


%Problem 10, 3.37

%by doing it this way, the less than operation can be avoided

if val >= 4
    disp('OK')
    
else
    disp('smaller')

end