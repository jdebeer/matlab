function   [A, b] = poisson_model(n)
% Sparse form of the above MATLAB code fragment 
% Condition number ~ 4(n + 1)^2/pi^2  (Persson P O 2006) 
h  = 1.0/(n + 1);
e  = ones(n,1);
A1 = spdiags([-e,2*e,-e],-1:1,n,n);
A  = kron(A1,speye(n,n))+kron(speye(n,n),A1);
b  = h*h*sparse(ones(n^2, 1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

