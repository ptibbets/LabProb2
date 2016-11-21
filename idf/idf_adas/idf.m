clear all
close all

load('../idf_full2.mat')
load('copt_pend.mat')
copt_pend = copt;
load('copt_cart.mat')
copt_cart = copt;

% Initial coefficients
M = 0.355;
m = 0.2;
g = 9.81;
l = copt_pend(1);
a = 300;
b = copt_pend(2);
w = copt_pend(3);
t = copt_pend(4);
copt = [M a];

% lb and ub
lb = [0 0];
ub = [inf inf];

% Prepare data
time = idf_full2.time(3364:end);
pend = idf_full2.signals(2).values(3364:end) + pi;
cart = -idf_full2.signals(4).values(3364:end);

% Prepare rhs
rhs = @(t,x,c) [ ...
    x(2,:); ...
    (-m*l*l.*(x(4,:).^2).*sin(x(3,:)) + m*l*g.*sin(x(3,:)).*cos(x(3,:)) - b.*(tanh(t*x(4,:))*abs(x(4,:)).^w).*cos(x(3,:)) - c(2)*l.*x(2,:))./((c(1)+m)*l-m*l.*(cos(x(3,:)).^2)); ...
    x(4,:); ...
    ((c(1)+m)*g.*sin(x(3,:)) - m*l.*(x(4,:).^2).*sin(x(3,:)).*cos(x(3,:)) - c(2).*x(2,:).*cos(x(3,:)) - ((c(1)+m)*b/(m*l)).*(tanh(t*x(4,:))*abs(x(4,:)).^w))./((c(1)+m)*l-m*l.*(cos(x(3,:)).^2)) ...
    ];

% Run opitmalization engine
options = optimset('display', 'iter', 'maxiter', 1000);
rhsc = @(c) qdiff2_c(rhs, c, time, [cart(1); 0; pend(1); 0], [cart pend]);
copt = lsqnonlin(rhsc, copt, lb, ub, options);
x = solve_c(rhs, copt, time, [cart(1); 0; pend(1); 0]);

figure
plot(time, x(:,1), time, cart)
figure
plot(time, x(:,3), time, pend)



