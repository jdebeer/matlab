

%this is a function for phys100hw6, made to evaluate the integral of the 
%beta function at z and w, and compare it to the built-in function
%beta(z,w)


z = 5; w = 5;


betafun = @(t) t.^(z-1) .* (1-t).^(w-1);

quadbetafun = quadgk(betafun,0,1);

betadif = quadbetafun - beta(z,w)

