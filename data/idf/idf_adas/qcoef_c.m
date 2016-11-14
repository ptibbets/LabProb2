function [ q ] = qcoef_c( rhs, c, tspan, x0, xr )
    [~,x] = solve_c(rhs, c, tspan, x0);
    q = xr - x(:,1);
end

