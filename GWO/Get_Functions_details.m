%___________________________________________________________________%
%  Grey Wolf Optimizer (GWO) source codes version 1.0               %
%                                                                   %
%  Developed in MATLAB R2011b(7.13)                                 %
%                                                                   %
%  Author and programmer: Seyedali Mirjalili                        %
%                                                                   %
%         e-Mail: ali.mirjalili@gmail.com                           %
%                 seyedali.mirjalili@griffithuni.edu.au             %
%                                                                   %
%       Homepage: http://www.alimirjalili.com                       %
%                                                                   %
%   Main paper: S. Mirjalili, S. M. Mirjalili, A. Lewis             %
%               Grey Wolf Optimizer, Advances in Engineering        %
%               Software , in press,                                %
%               DOI: 10.1016/j.advengsoft.2013.12.007               %
%                                                                   %
%___________________________________________________________________%

% This function containts full information and implementations of the benchmark 
% functions in Table 1, Table 2, and Table 3 in the paper

% lb is the lower bound: lb=[lb_1,lb_2,...,lb_d]
% up is the uppper bound: ub=[ub_1,ub_2,...,ub_d]
% dim is the number of variables (dimension of the problem)

function [lb,ub,dim,fobj] = Get_Functions_details(F)


switch F
    case 'F1'%THE BOUNDS

    global Startpoint
    global Targetpoint
    global siz    
    global dim
    siz=Targetpoint(1)-Startpoint(1)-1;
        
        fobj = @F1;
        lb=-100;
        ub=100;
        dim=siz;
  
end

end

% F1

function o = F1(x)

    global Startpoint
    global Targetpoint
    global xcoor;
    global ycoor;
    global xo;
    global yo;
    global siz
    global xnew
    %global siz;
    xo=xcoor;
    yo=ycoor;
%determine the amount of turning points in our path
siz=Targetpoint(1)-Startpoint(1);
cost=0;
%calculate the fuel cost for each turning point in our path 
xnew = [ycoor(1) x(1:end) ycoor(end)];
%add the fuel cost for each point
for c = 1:siz
distance=CalcDistance(xcoor(c),xnew(c),xcoor(c+1),xnew(c+1));
cost=cost+distance;
end
%calculate the threat cost for each threat
global threats
global numberofthreats
global threatrange
global threatdanger
global threat
threatcost=0;
sizz=siz+1;
for c = 1:sizz
for n = 1:numberofthreats    
threat=CalcDistance(xcoor(c),xnew(c),threats(1,n),threats(2,n));
if threat<=threatrange
threatcost=(threat*threatdanger)+threatcost;   
end
end
end
cost=cost+threatcost;
o=cost;
end
