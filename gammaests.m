
clear x


%this is a function for phys100hw6, made to test at which x's quadgk
%returns good values for the gamma function, as compared to the built-in
%gamma function


difmat = zeros(21,2);
difmat(:,1) = linspace(0,20,21)';



for i = 0:20
    x=i;
    gammafun = @(t) (t.^(x-1)).*exp(-t);
    dif = quadgk(gammafun,0,inf) - gamma(x);
    difmat(i+1,2) = dif;
end

difmat