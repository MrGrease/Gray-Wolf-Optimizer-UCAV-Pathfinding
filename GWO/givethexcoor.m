
function [ xcoor ] = givethexcoor(coefficients,startpoint,targetpoint)
%this function finds the coefficients for the x axis of the line that
%connects the starting and target point.
siz=targetpoint(1)-startpoint(1)+1;
a=startpoint(1);
for c = 1:siz
xcoor(c)=a;
a=a+1;
end
end
