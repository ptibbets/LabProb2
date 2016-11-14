clear all
close all

load('../idf_cart_left.mat')
load('../idf_cart_right.mat')

A = 5;
B = 20000;

timer = idf_cart_right.time;
cartr = (idf_cart_right.signals(4).values - 17180) * 0.05739917434;
forcr = idf_cart_right.signals(1).values;

ur = @(t) interp1q(timer, forcr, t);
rhsr = @(t,x,c) [x(2); -c(1)*x(2) + c(2)*ur(t)];

copt = lsqnonlin(@(c) qcoef_c(rhsr, c, timer, [cartr(1); 0], cartr), [A,B]);
[t,x] = solve_c(rhsr, copt, timer, [cartr(1); 0]);
plot(timer, x(:,1), timer, cartr)
