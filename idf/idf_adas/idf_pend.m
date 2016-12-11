clear all
close all

load('../idf_wah.mat')

% Initial coefficients
g = 9.81;
m = 0.2;
l = 0.4496;
b = 0.0023;
w = 1;
s = 10;
copt = [l b w s];

% lb and ub
lb = [0 0 0 0];
ub = [inf inf 2 inf];

% Prepare data
time = idf_wah.time(805:end);
pend = idf_wah.signals(2).values(805:end) + pi;

% Prepare rhs
rhs = @(t,x,c) [x(2); (g/c(1))*sin(x(1)) - (c(2)/(m*c(1)*c(1)))*tanh(c(4)*x(2))*abs(x(2)).^c(3)];

% load('copt_pend')

% Run opitmalization engine
options = optimset('display', 'iter', 'maxiter', 1000);
rhsc = @(c) qdiff_c(rhs, c, time, [pend(1); 0], pend);
copt = lsqnonlin(rhsc, copt, lb, ub, options);
x = solve_c(rhs, copt, time, [pend(1); 0]);
plot(time, x(:,1)-pi, time, pend-pi)
grid on
xlabel('Czas [s]')
ylabel('K�t wahad�a [rad]')
legend('Model','Obiekt rzeczywisty')

clear b g l m w s pend idf_wah lb ub options rhs rhsc time x
save('copt_pend.mat')
