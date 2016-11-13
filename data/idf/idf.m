close all;
clear all;

%% Cart move left
[t, x, u] = get_cart_left_move();
cl = fminsearch(@(c) sum(get_cart_move_diff(...
    get_cart_rhs(c), t, x, u)) .^ 2, [12000; 0.0003]);

%%
figure()
rhs = get_cart_rhs(cl);
xp = get_cart_model_move(rhs, t, x, u);
plot(t, x, t, xp(:, 1))

%% Cart move right
[t, x, u] = get_cart_right_move();
cr = fminsearch(@(c) sum(get_cart_move_diff(...
    get_cart_rhs(c), t, x, u)) .^ 2, [12000; 0.0003]);

%%
figure()
rhs = get_cart_rhs(cr);
xp = get_cart_model_move(rhs, t, x, u);
plot(t, x, t, xp(:, 1))