model_prep

l0 = [0 0 0 0];
x0 = [0 0 pi+pi/4 0];

Q = [0.1 0 0 0; 0 0.001 0 0; 0 0 1 0; 0 0 0 1];
R = 0.00001;

ss = linearize('Wahadlo_model_lin', 'Wahadlo_model_lin/Cart-Pendulum System');
E1 = eig(ss.a);
[K, S, E2] = lqr(ss, Q, R);
E1
E2
K
