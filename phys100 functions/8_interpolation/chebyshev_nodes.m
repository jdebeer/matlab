function r =  chebyshev_nodes(a, b, n)
% exapanded Chebyshev points
% a = lower limit 
% b = upper limit; 
% n +1 is number of points
% Neumaier, A. 2001, Introduction to Numerical Analysis [p. 145]
% (Cambridge: Cambridge, UK) 

    i  = 0:n; 
    ar = ((2*i + 1)*pi)./(2*n + 2);
    r  = 0.5*(a + b) + 0.5*(a - b)*cos(ar); 
    r  = r/cos(pi/(2*n + 2));