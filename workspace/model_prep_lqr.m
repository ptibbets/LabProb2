model_prep

x_0 = [0 0 0.1 0];

Q = [1 0 0 0; 0 1 0 0; 0 0 10 0; 0 0 0 1];
R = 1;

ss = linearize('model_ver_model', 'model_ver_model/Cart-Pendulum System');
K = lqr(ss, Q, R);
