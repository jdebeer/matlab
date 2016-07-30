function eccentricity = elecc(a, b)

%this is a function which requires the semi-major/minor axes of an ellipse
%and ruturns the ellipse's eccentricity

eccentricity = sqrt(1 - (b^2)/a);

end