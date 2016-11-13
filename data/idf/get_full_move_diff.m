function [ diff ] = get_full_move_diff( rhs, t, x, u )
    xp = get_full_model_move(rhs, t, x, u);
    diff = [xp(:, 1), xp(:, 3)] - x;
    diff = sum(diff(:) .^ 2);
end