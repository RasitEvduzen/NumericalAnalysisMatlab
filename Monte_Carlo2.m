% Monte Carlo Simulation Pi calculation with unit circle
% 06-Oct-2017
% Written By : Raþit EVDÜZEN
clc,clear all,close all;

NoS = 500;  % Number of simulation
NoI = 0;      % Number of Ýnsade
NoO = 0;      % Number of Outside

% Plot Parameters
r = 1;
theta = linspace(0,2*pi);
x1 = r*cos(theta);
y1 = r*sin(theta);

axis([-1.5 1.5 -1.5 1.5]), grid minor
for i = 1: NoS
    hold off
    x = 2*rand-1;
    y = 2*rand-1;
    hold on
    rectangle('Position',[-1 -1 2 2],'LineWidth',2)
    if [(x^2) + (y^2)] < 1
        NoI = NoI + 1;
        scatter(x,y,'b','filled')
    else
        NoO = NoO + 1;
        scatter(x,y,'b','filled')
    end
    pi = (4 * NoI) / (NoS);  % Calculation pi
    plot(x1,y1,'r','LineWidth',2),title(['Number of Ýteration',num2str(i),'  Approximation of Pi :',num2str(pi)])
    pause(0.0001)
end