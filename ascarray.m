function asctruevec = ascarray(array)


%asctruevec receives an input array of six-digit integers and determines
%if the first 3 digits of each element are in ascending order.  It then
%returns a vector of logical true or falses that correspond to the results.


array = array';
raylen = length(array);
asctruevec = zeros(1,raylen);

for i = 1:raylen
    intstr = int2str(array(i));
    if (intstr(3) > intstr(2)) && (intstr(2) > intstr(1))
    asctruevec(1,i) = 1;
    end
end
end