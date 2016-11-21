clear all
close all

load('../idf_cart_left.mat')
load('../idf_cart_right.mat')

% Initial coefficients
copt = [5 20000];

% lb and ub
lb = [0 0];
ub = [inf inf];

% Prepare data
time = idf_cart_right.time;
cart = (idf_cart_right.signals(4).values - 17180) * 0.05739917434;
forc = idf_cart_right.signals(1).values;

% Prepare rhs
f = @(t) interp1q(time, forc, t);
rhs = @(t,x,c) [x(2); c(2)*f(t) - c(1)*x(2)];

% Run opitmalization engine
options = optimset('display', 'iter', 'maxiter', 1000);
rhsc = @(c) qdiff_c(rhs, c, time, [cart(1); 0], cart);
copt = lsqnonlin(rhsc, copt, lb, ub, options);
x = solve_c(rhs, copt, time, [cart(1); 0]);
plot(time, x(:,1), time, cart)

clear cart f forc idf_cart_left idf_cart_right lb ub options rhs rhsc time x
save('copt_cart.mat')
