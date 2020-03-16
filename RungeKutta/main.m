clc,clear all,close all;
% 4-Order Runge Kutta Based Nonlinear System Simulation
% Rasit EVDUZEN
% 16-Mar-2017


x = [0.2 0.1 0.4]';   % State initial condition
Ts = 0.01;            % Sampling time
N = 10;               % Simulation time
T = N/Ts;             % Time
umin = 0;             % System input minimum value
umax = 2;             % System input maximum value
pmin = 10;            % System input minimum duration time
pmax = 50;            % System input maximum duration time



X = []; k = 0; loop = 1;
while loop
    u = umin + rand*(umax-umin);
    p = pmin + round(rand*(pmax-pmin));
    for q=1:p
        k = k + 1;
        [x,y] = RK4(x,u,Ts);
        X = [X,x];
        U(k) = u;
        Y(k) = y;
        
        if k >= (T)
            loop = 0;
        end
    end
end
% return
% System Narx Data Created
ny = 4; nu = 3;
INPUT = []; OUTPUT = []; loop1 = 1; n = 0;
while loop1
    n = n + 1;
    iv = [Y(n:n+ny-1),U(n:n+nu-1)];
    INPUT = [INPUT; iv];
    OUTPUT = [OUTPUT; Y(n+ny)];
    if n+ny >= length(U)
        loop1 = 0;
    end
end
save RKsim INPUT OUTPUT

% Plot Algorithm
subplot(311)
plot(1:k,Y),grid minor,
title('System Output')

subplot(312)
plot(1:k,U),grid minor
title('System Input')

subplot(313)
plot(1:k,X),grid minor
title('System State')


