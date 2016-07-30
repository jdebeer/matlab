function inputdate = date(month, day, year)

%This is a function that receives three integers and ascertains whether
%these integers constitute a legitimate date

%In either case the function returns a string

%if integers are not entered, matlab will issue an error message

datevec = [month day year];
truevec = ((datevec == int32(datevec)) == [1 1 1]);

%this function accounts for days with 31, 30 and 28 days.  It does not,
%however, account for leap years.

if (month == 2) && (day > 28)
    
    fprintf('Sorry, %.0f/%.0f/%.0f is not a legtimate date. \n', month, day, year)
    
elseif ((month == 4 ) || (month == 6 ) || (month == 9 ) || (month == 11 )) && (day > 30)
    
    fprintf('Sorry, %.0f/%.0f/%.0f is not a legtimate date. \n', month, day, year)
    
elseif  (0 < month) && (month < 13) && (true(truevec)) && (year < 2013) &&  (0 < day) && (day < 32)
                
    fprintf('%.0f/%.0f/%.0f is a legtimate date. \n', month, day, year)
    
else
        
    fprintf('Sorry, %.0f/%.0f/%.0f is not a legtimate date. \n', month, day, year)
    
end
end