% This script linearizes pendulum model, and computes LQR control matrix K.
% It also prepares initial condition for simulation as x0.
model_prep

l0 = [0 0 0 0];
x0 = [0 0 0.1 0];

Q = [0.1 0 0 0; 0 0.001 0 0; 0 0 1 0; 0 0 0 1];
R = 0.00001;

ss = linearize('Wahadlo_model_lin', 'Wahadlo_model_lin/Cart-Pendulum System');
[K, S, E] = lqr(ss, Q, R)
