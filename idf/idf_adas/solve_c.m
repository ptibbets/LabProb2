function [ x ] = solve_c( rhs, c, tp, x0 )
    [~,x] = ode45(@(t,x) rhs(t,x,c), tp, x0);
end

