% 04-May-2019 
% Pau EEM MSC
% Rasit EVDÜZEN
%% Buffons needle - Monte Carlo Approach
clc,clear all,close all;

N = 300; % Number of simulation
subplot(211)
hold on;
grid minor;
axis([-2,12,-2,12])
rectangle('Position',[-1 -1 12 12],'FaceColor',[1 1 0],'EdgeColor','k','LineWidth',1.5)
h1   = line([0,0],[0 10]); set(h1,'Color',[1 0 0],'LineWidth',2)
title('Buffons needle - Monte Carlo Approach')
for i = 1:10
    h(i) = line([0+i,0+i],[0 10]); set(h(i),'Color',[1 0 0],'LineWidth',2)
    set(gcf,'Color',[1 1 1])
end
d = (1/2)*rand(1,N);
teta = (pi/2)*rand(1,N);
x0 = 10*rand(1,N);
y0 = 10*rand(1,N);

for k = 1:N
%         t(k) = line([x0(k),x0(k)+(sqrt(2)/2)],[y0(k) y0(k)+((teta(k)*(-x0(k)+(sqrt(2)/2)))+y0(k))]); set(t(k),'Color',[0 0 1])
    t(k) = line([x0(k),x0(k)+(sqrt(2)/2)],[y0(k) y0(k)+(sqrt(2)/2)]); set(t(k),'Color',[0 0 1])
%     pause(0.1)
end

subplot(212)
hold on
rectangle('Position',[0 0 1.6 0.5],'FaceColor',[1 1 1],'EdgeColor','k','LineWidth',1)
rdot = 0;   % Number of red dot
bdot = 0;   % Number of black dot
for j=1:N
    temp = sin(teta(j))/2;
    if d(j) < temp
        rdot = rdot + 1;
        scatter(teta(j),d(j),'r','filled','LineWidth',0.05);
    else
        bdot = bdot + 1;
        scatter(teta(j),d(j),'k','filled','LineWidth',0.05);
    end
end
a1 = 0:0.01:1.6;
a2    = sin(a1)/2;
plot(a1,a2,'g','lineWidth',2.5)
axis([0 1.6 0 0.5]),xlabel('\theta'),ylabel('d')
solve = rdot / (N);
solvepi = 2 * (N / rdot);
title(['Number of Simulation = ',num2str(N),' Estimated Probability = ',num2str(solve),' True Value = ',num2str(2/pi)])
fprintf(['Aproximate Pi/2 Value(0.6366) = ',num2str(solve),'\n Aproximate Pi Value(3.1416) = ',num2str(solvepi)])

