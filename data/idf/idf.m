close all;
clear all;

%% Cart move left
[t, x, u] = get_cart_left_move();
cl = fminsearch(@(c) get_cart_move_diff(get_cart_rhs(c), t, x, u), ...
    [12000; 0.0003]);

%%
figure()
rhs = get_cart_rhs(cl);
xp = get_cart_model_move(rhs, t, x, u);
plot(t, x, t, xp(:, 1))

%% Cart move right
[t, x, u] = get_cart_right_move();
cr = fminsearch(@(c) get_cart_move_diff(get_cart_rhs(c), t, x, u), ...
    [12000; 0.0003]);

%%
figure()
rhs = get_cart_rhs(cr);
xp = get_cart_model_move(rhs, t, x, u);
plot(t, x, t, xp(:, 1))

%% Full object
[t, x, u] = get_full_move();
cf = fminsearch(@(c) get_full_move_diff(get_full_rhs( ...
    [(cl + cr) ./ 2; c]), t, x, u), [9]);

%%
figure()
rhs = get_full_rhs([cr; cf]);
xp = get_full_model_move(rhs, t, x, u);
subplot(2, 1, 1)
plot(t, x(:, 1), t, xp(:, 1))
subplot(2, 1, 2)
plot(t, x(:, 2), t, xp(:, 3))