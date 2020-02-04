function [ coefficients ] = mathoperations( x1,y1,x2,y2 )
%this function finds the coefficients for the equation of the line that
%connects the starting and target point.
coefficients = polyfit([x1, x2], [y1, y2], 1);



end
