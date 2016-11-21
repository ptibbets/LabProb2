function [ qd ] = qdiff2_c( rhs, c, tp, x0, xr )
    x = solve_c(rhs, c, tp, x0);
    qd = [xr(:,1),xr(:,2)] - [x(:,1),x(:,3)];
end

