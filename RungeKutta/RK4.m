function [x,y] = RK4(x,u,Ts)
%-------function input
% x = state
% u = input
% Ts = Sampling time
%-------function output
% x = calculate state
% y = output

N = length(x);    %
x0 = x;           % state initial value

% Nonlinear State Space System
F = [ 1-4*x(1)+0.5*x(2)^2;
    -x(2)+3*x(1)-1.5*x(2)^2+u;
    -x(3)+x(2)^2;];

for i=1:N
    K(i,1) = Ts*F(i);
end
% -----------------------------
x = x0 + K(:,1)/2;
F = [ 1-4*x(1)+0.5*x(2)^2;
    -x(2)+3*x(1)-1.5*x(2)^2+u;
    -x(3)+x(2)^2;];

for i=1:N
    K(i,2) = Ts*F(i);
end
% -----------------------------
x = x0 + K(:,2)/2;
F = [ 1-4*x(1)+0.5*x(2)^2;
    -x(2)+3*x(1)-1.5*x(2)^2+u;
    -x(3)+x(2)^2;];

for i=1:N
    K(i,3) = Ts*F(i);
end
% -----------------------------
x = x0 + K(:,3);
F = [ 1-4*x(1)+0.5*x(2)^2;
    -x(2)+3*x(1)-1.5*x(2)^2+u;
    -x(3)+x(2)^2;];

for i=1:N
    K(i,4) = Ts*F(i);
end
% -----------------------------
for i=1:N
   x(i) = x(i) + K(i,1)/6 + K(i,2)/3 + K(i,3)/3 + K(i,4)/6;
end
y = x(3);
end

