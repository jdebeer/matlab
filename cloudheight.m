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