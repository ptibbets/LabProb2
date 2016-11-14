function [] = plot_c( rhs, c, tspan, x0 )
    [t,x] = solve_c(rhs, c, tspan, x0);
    plot(t,x)
end

