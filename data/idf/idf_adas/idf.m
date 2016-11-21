clear all
close all

load('../idf_full.mat')
% load('copt_pend.mat')
% copt_pend = copt;
% load('copt_cart.mat')
% copt_cart = copt;

% Initial coefficients
M = 5000;
m = 3;
a = 100;
b = 0.3;
g = 9.81;
l = 0.44;
copt = [M + m m*l a b g l];

% lb and ub
lb = [0 0 0 0 0 0];
ub = [inf inf inf inf inf inf];

% Prepare data
time = idf_full.time(1452:end);
pend = idf_full.signals(2).values(1452:end) + pi;
cart = -idf_full.signals(4).values(1452:end)/1000;

% Prepare rhs
rhs = @(t,x,c) [ ...
    x(2,:); ...
    (-c(2)*c(6).*(x(4,:).^2).*sin(x(3,:)) + c(2)*c(5).*sin(x(3,:)).*cos(x(3,:)) - c(4).*x(4,:).*cos(x(3,:)) - c(3)*c(6).*x(2,:))./(c(1)*c(6)-c(2).*(cos(x(3,:)).^2)); ...
    x(4,:); ...
    (c(1)*c(5).*sin(x(3,:)) - c(2).*(x(4,:).^2).*sin(x(3,:)).*cos(x(3,:)) - c(3).*x(2,:).*cos(x(3,:)) - (c(1)*c(4)/c(2)).*x(4,:))./(c(1)*c(6)-c(2).*(cos(x(3,:)).^2)) ...
    ];

% Run opitmalization engine
options = optimset('display', 'iter', 'maxiter', 1000);
rhsc = @(c) qdiff2_c(rhs, c, time, [cart(1); 0; pend(1); 0], [cart pend]);
copt = lsqnonlin(rhsc, copt, lb, ub, options);
x = solve_c(rhs, copt, time, [cart(1); 0; pend(1); 0]);

% figure
% plot(time, x(:,1), time, cart)
figure
plot(time, x(:,3), time, pend)



