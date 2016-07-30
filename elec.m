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