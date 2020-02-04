function [ ycoor ] = givetheycoor(coefficients,startpoint,targetpoint,xcoor)
%this function finds the coefficients for the x axis of the line that
%connects the starting and target point.

a=coefficients(1);
b=coefficients(2);



siz=targetpoint(1)-startpoint(1)+1;

for c = 1:siz
ycoor(c)=a*xcoor(c)+b;    
end
end
