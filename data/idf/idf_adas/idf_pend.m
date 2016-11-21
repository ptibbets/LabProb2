clear all
close all

load('../idf_wah.mat')

% Initial coefficients
g = 9.81;
l = 0.44;
b = 0.011;
m = 1;
copt = [g/l b/(m*l*l)];

% lb and ub
lb = [0 0];
ub = [inf inf];

% Prepare data
time = idf_wah.time(805:end);
pend = idf_wah.signals(2).values(805:end) + pi;

% Prepare rhs
rhs = @(t,x,c) [x(2); c(1)*sin(x(1)) - c(2)*x(2)];

% Run opitmalization engine
options = optimset('display', 'iter', 'maxiter', 1000);
rhsc = @(c) qdiff_c(rhs, c, time, [pend(1); 0], pend);
copt = lsqnonlin(rhsc, copt, lb, ub, options);
x = solve_c(rhs, copt, time, [pend(1); 0]);
plot(time, x(:,1), time, pend)

clear b g l m pend idf_wah lb ub options rhs rhsc time x
save('copt_pend.mat')
