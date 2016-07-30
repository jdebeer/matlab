  function result = newton_cotes(f, a, b, N)
% function result = newton_cotes(f, a, b, N)
% INPUT: 
%            f     = name of the function to be integrated [STRING!] 
%            a     = lower integration limit 
%            b     = upper integration limit 
%            N     = number of terms (integrands) 1 <= N <= 12
% OUTPUT: 
%           result = the N-point Newton-Cotes approximation of the    
%                      integral of f from a to b. 
% Introduction to Scientific Computing [2nd Ed 2000] (p. 139) 
%   C F van Loan (Prentice Hall: Upper Saddle River, NJ) 

  if N == 1
     % Midpoint rule 
     f    = f((a + b)/2);   
     result = (b-a)*f; 
     return;
  elseif N > 11 
     N = 11;
     disp('Reset N to 11'); 
  end
w = NCweights(N);
x = linspace(a, b, N)';
f = f(x);
result = (b - a)*(w'*f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function w = NCweights(N)
% w = NCweights(N)
%
% w is a column N-vector consisting of the weights for the N-point Newton-Cotes rule.
% N is an integer that satisfies 2 <= N <= 11.
% Introduction to Scientific Computing [2nd Ed 2000] (p. 140) 
%   C F van Loan (Prentice Hall: Upper Saddle River, NJ)

if      N==2,   w=[1 1]'/2; 
elseif  N==3,   w=[1 4 1]'/6; 
elseif  N==4,   w=[1 3 3 1]'/8; 
elseif  N==5,   w=[7 32 12 32 7]'/90; 
elseif  N==6,   w=[19 75 50 50 75 19]'/288; 
elseif  N==7,   w=[41 216 27 272 27 216 41]'/840; 
elseif  N==8,   w=[751 3577 1323 2989 2989 1323 3577 751]'/17280; 
elseif  N==9,   w=[989 5888 -928 10496 -4540 10496 -928 5888 989]'/28350; 
elseif  N==10,  w=[2857 15741 1080 19344 5778 5778 19344 1080 15741 2857]'/89600; 
else            w=[16067 106300 -48525 272400 -260550 427368 -260550 272400 -48525 106300 16067]'/598752; 
end
