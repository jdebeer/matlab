char = input('Please enter a letter from the alphabet, eg a,b,c,...,y,z: ', 's');

if isletter(char) == 1
    fprintf('%c is a letter from the alphabet. nice work buddy.\n', char)
    
else
    fprintf('Ehh, wrong; %c is not a letter from the alphabet, buddy. \n\nPlease try again.\n', char) 
    
end