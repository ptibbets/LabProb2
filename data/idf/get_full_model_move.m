function [ xp ] = get_full_model_move( rhs, t, x, u )
    [~, xp] = ode45(@(tr, xr) (rhs(tr, xr, interp1q(t, u, tr))), t, ...
        [x(1, 1); 0; x(1, 2); 0]);
end