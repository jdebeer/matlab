function [ ] = raleigh_and_weibull( windspeeds )

windspeeds = sort(windspeeds);
Ubar = sum(windspeeds)/length(windspeeds);

raleigh = pi/2.*windspeeds/Ubar^2.*exp(-pi/4.*(windspeeds/Ubar).^2);
figure;
plot(windspeeds,raleigh);



% VVVV note sure why this isn't working VVVV

    % stdU = std(windspeeds); %sample standard deviation
    % syms k c;
    % gamma_func = gamma(1+2/k);
    % equ1 = stdU^2 == Ubar^2*((gamma_func/gamma_func^2)-1);
    % equ2 = Ubar == c*gamma(1+1/k);
    % [k c] = solve(equ1,equ2,k,c);

    % weibull = (k/c)*(windspeeds/c).^(k-1).*exp(-(windspeeds/c).^k);
    % figure;
    % plot(windspeeds,weibull);
    
% ^^^^ note sure why this isn't working ^^^^


% but this works :)

figure;
plot(windspeeds,wblpdf(windspeeds));


end

