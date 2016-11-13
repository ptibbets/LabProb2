close all
clear all

%% cart left

%idf_cart_left_prep
%lrhs = @(t, x, c) [x(2) ; c(1)*interp1q(time_full, force_full, t) + c(2)*x(2).*abs(x(2))];

%coef = fminsearch(@(c) sum(qFun(lrhs, cart_full, time_full, c) .^2), [4000; -6]);

%options = optimset('display', 'iter');
%coef = lsqnonlin(@(c) qFun(lrhs, cart_full, time_full, c), coef, [1 -1000], [10000 -0.000001], options);