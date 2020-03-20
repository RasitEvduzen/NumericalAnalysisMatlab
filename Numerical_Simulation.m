clc,clear all,close all;
% ODE numerical integration
% Written By: Rasit EVDÜZEN
% 20-Mar-2020

%------------Runge Kutta - 4 calculation for single ode
time = 4;                                           
h = 0.5;                                            % step size
x = 0:h:time;                                       % State vector    
y_4th(1) = 1;                                    % initial condition
% F_xy = @(t,r) 3.*exp(-t)-0.4*r;                % change the function as you desire
F_xy = @(t,r) -2*t^3 + 12 *t^2 - 20*t +8.5 ;     

t = 0:h:time;                                                   % simulation vector
Yreal = (-0.5*t.^4) + (4*t.^3) - (10*t.^2) + (8.5*t) + 1;       % Real solution
for i=1:(length(x)-1)                              
    k_1 = F_xy(x(i),y_4th(i));
    k_2 = F_xy(x(i)+0.5*h,y_4th(i)+0.5*h*k_1);
    k_3 = F_xy((x(i)+0.5*h),(y_4th(i)+0.5*h*k_2));
    k_4 = F_xy((x(i)+h),(y_4th(i)+k_3*h));

    y_4th(i+1) = y_4th(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;  
    
end

%------------Runge Kutta - 2 "Heun" calculation for single ode
y_2th(1) = 1;  % initial condition     
for i=1:(length(x)-1)                       
    k_1 = F_xy(x(i),y_2th(i));
    k_2 = F_xy(x(i)+h,y_2th(i)+h*k_1);
    y_2th(i+1) = y_2th(i) + (1/2)*(k_1+k_2)*h;  
end

%------------Runge Kutta - 1 "Euler" calculation for single ode                              
y_1th(1) = 1;       
for i=1:(length(x)-1)                      
    k_1 = F_xy(x(i),y_1th(i));
    y_1th(i+1) = y_1th(i) + k_1*h;  
end

%------------PLOT 
subplot(221)
plot(t,Yreal,'r','linewidth',2),grid on,hold on
plot(x,y_1th,'k--','linewidth',2)
plot(x,y_2th,'g--','linewidth',2)
plot(x,y_4th,'b--','linewidth',2)
legend({'Real Solution','RK-1 "Euler" Solution','RK-2 "Heun" Solution','RK-4 Solution'})
xlabel('Time')
ylabel('F(x,y)')
title('ODE INTEGRATION')

subplot(222)
plot(t,Yreal,'r','linewidth',2),grid on,hold on
plot(x,y_1th,'b--','linewidth',2)
legend({'Real Solution','RK-1 "Euler" Solution'})
xlabel('Time')
ylabel('F(x,y)')
title(['Integration Error: ',num2str(abs((norm(Yreal)-norm(y_1th))))])

subplot(223)
plot(t,Yreal,'r','linewidth',2),grid on,hold on
plot(x,y_2th,'b--','linewidth',2)
legend({'Real Solution','RK-2 "Heun" Solution'})
xlabel('Time')
ylabel('F(x,y)')
title(['Integration Error: ',num2str(abs((norm(Yreal)-norm(y_2th))))])

subplot(224)
plot(t,Yreal,'r','linewidth',2)
grid on,hold on
plot(x,y_4th,'b--','linewidth',2)
legend({'Real Solution','RK-4 Solution'})
xlabel('Time')
ylabel('F(x,y)')
title(['Integration Error: ',num2str(abs((norm(Yreal)-norm(y_4th))))])

