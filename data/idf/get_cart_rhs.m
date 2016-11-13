function [ rhs ] = get_cart_rhs( c )
    rhs = @(t, x, u) ([x(2); u * c(1) - x(2) * c(2) * c(1)]);
end