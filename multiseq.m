function oneofakind = multiseq(seq)

%multiseq receives a sequence of positive integers and outputs a sequence
%in which subsequences of repeated integers are replaced be a single
%instance of the digit preceded by an appropriate count

sequlen = length(seq);
j = 0;

for i = 1:(sequlen-1)
    if (seq(i) == seq(i+1))      
        j = j + 1;
    end
    if seq(i) ~= seq(i+1)
            if j > 0
                j = j+1;
                fprintf('%d*%d ',j,seq(i))
                j = 0;
            else
            
            fprintf('%d ',seq(i))
            end
    end
end

fprintf('%d \n', seq(sequlen))
end