function [ t,x ] = solve_c( rhs, c, tspan, x0 )
    [t,x] = ode45(@(t,x) rhs(t,x,c), tspan, x0);
end

