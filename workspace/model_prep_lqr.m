model_prep

l0 = [0 0 0 0];
x0 = [0 0 0.1 0];

Q = [1 0 0 0; 0 1 0 0; 0 0 1000 0; 0 0 0 1];
R = 1000000;

ss = linearize('model_lin', 'model_lin/Cart-Pendulum System');
[K, S, E] = lqr(ss, Q, R);
