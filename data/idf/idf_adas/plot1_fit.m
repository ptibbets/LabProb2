function [] = plot1_fit( rhs, c, x0, t, xr )
    [t,x] = solve_c(rhs, c, t, x0);
    plot(t,x(:,1), t, xr)
end

