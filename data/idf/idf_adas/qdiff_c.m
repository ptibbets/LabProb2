function [ qd ] = qdiff_c( rhs, c, tp, x0, xr )
    x = solve_c(rhs, c, tp, x0);
    qd = xr - x(:,1);
end

