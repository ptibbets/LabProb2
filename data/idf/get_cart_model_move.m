function [ xp ] = get_cart_model_move( rhs, t, x, u )
    [~, xp] = ode45(@(tr, xr) (rhs(tr, xr, interp1q(t, u, tr))), t, ...
        [x(1); 0]);
end