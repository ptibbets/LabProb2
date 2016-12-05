model_prep

Tv = 0.02;

l0 = [0 0 0 0];
x0 = [0 0 0.1 0];

Q = [0.1 0 0 0; 0 0.001 0 0; 0 0 1 0; 0 0 0 1];
R = 0.00001;

ss = linearize('model_lin', 'model_lin/Cart-Pendulum System');
[K, S, E] = lqr(ss, Q, R)

%K = K.*[1 1 2 0.5];
%K
