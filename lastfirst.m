function name=lastfirst


%This function prompts a user separately for his/her first/last name
%   form of call: lastfirst
%question on this regarding why the function returns 'ans' instead of
%'name'

last = input('Please enter last name: ', 's');
first = input('Please enter first name: ', 's');

name = sprintf('%s, %s', last, first);

end

