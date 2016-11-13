function [ diff ] = get_cart_move_diff( rhs, t, x, u )
    xp = get_cart_model_move(rhs, t, x, u);
    diff = xp(:, 1) - x;
    diff = sum(diff .^ 2);
end