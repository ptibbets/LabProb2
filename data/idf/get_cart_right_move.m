function [ t, x, u ] = get_cart_right_move()
    load('idf_cart_right.mat');
    t = idf_cart_right.time;
    x = (idf_cart_right.signals(4).values - 17180) * 0.05739917434;
    u = idf_cart_right.signals(1).values;
end