function A=abm(f,T,Y)

%Input   - f is the function entered as a string 'f'
%        - T is the vector of abscissas
%        - Y is the vector of ordinates
%Remark.  The first four coordinates of T and Y must
%         have starting values obtained with RK4
%Output - A=[T' Y'] where T is the vector of abscissas and
%         Y is the vector of ordinates

% NUMERICAL METHODS: MATLAB Programs
%(c) 1999 by John H. Mathews and Kurtis D. Fink
%To accompany the textbook:
%NUMERICAL METHODS Using MATLAB,
%by John H. Mathews and Kurtis D. Fink
%ISBN 0-13-270042-5, (c) 1999
%PRENTICE HALL, INC.
%Upper Saddle River, NJ 07458
clf
n=length(T);
if n<5, break, end;

F=zeros(1,4);
F=feval(f,T(1:4),Y(1:4));
h=T(2)-T(1);

for k=4:n-1
   %Predictor
   p=Y(k)+(h/24)*(F*[-9 37 -59 55]');
   T(k+1)=T(1)+h*k;
   F=[F(2) F(3) F(4) feval(f,T(k+1),p)];
   %Corrector
   Y(k+1)=Y(k)+(h/24)*(F*[1 -5 19 9]');
   F(4)=feval(f,T(k+1),Y(k+1));
   plot(T,Y,'gs-')

end

A=[T' Y'];

