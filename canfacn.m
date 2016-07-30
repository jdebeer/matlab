function canfacn(en,aint,bint)

%canfacn determines whether or not n can be factored into a^b

atotheb = aint^bint;

quotient = atotheb/en;

if int32(quotient) == quotient
    fprintf('%d can be factored into %d^%d; the quotient is %d \n',en,aint,bint,quotient)
else
    fprintf('%d cannot be factored into %d^%d \n',en,aint,bint)
end
end