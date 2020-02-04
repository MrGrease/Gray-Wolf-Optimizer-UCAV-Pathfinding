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

% You can simply define your cost in a seperate file and load its handle to fobj 
% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run GWO: [Best_score,Best_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)
%__________________________________________

clear all 
clc


global Positions; %declare the positions globally so that we can examine them in our works space.
global fitness;
global xcoor;
global ycoor;
global xo;
global yo;
global Startpoint;
global Targetpoint;
global siz
global dim
global threats
global numberofthreats
global threatrange
global threatdanger
global xnew
global threat
%global siz;
%Declare start and end points
%change these to change the resolution of your solution
Startpoint=[0,0];
Targetpoint=[10,10];
numberofthreats=2;
threats=[5 9; 4 1];
threatrange=2;
threatdanger=10;
%Find the coeff
coeff=mathoperations( Startpoint(1),Startpoint(2),Targetpoint(1),Targetpoint(2));
%gives the xcoordinates that the UCAV will follow
xcoor=givethexcoor(coeff,Startpoint,Targetpoint);
ycoor=givetheycoor(coeff,Startpoint,Targetpoint,xcoor);
SearchAgents_no=30; % Number of search agents
Function_name='F1'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)
Max_iteration=5000; % Maximum numbef of iterations
% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
[Best_score,Best_pos,GWO_cg_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
bestoutput = [ycoor(1) Best_pos(1:end) ycoor(end)];
subplot(2,1,1);
LineH =plot(xcoor,bestoutput);
title('Grafik A:Planlanan yol')
axis([0 10 0 10]);
%set(LineH, 'YLimInclude', 'off');
grid on;
subplot(2,1,2);
Line2 =plot(threats(1,:),threats(2,:),'*');
title('Grafik B:Tehlike noktalari')
grid on;
axis([0 10 0 10]);
%set(Line2, 'YLimInclude', 'off');
display(['The best solution obtained by GWO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by GWO is : ', num2str(Best_score)]);


         



