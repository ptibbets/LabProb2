function [ t, x, u ] = get_cart_left_move()
    load('idf_cart_left.mat');
    t = idf_cart_left.time;
    x = (idf_cart_left.signals(4).values - 17180) * 0.05739917434;
    u = idf_cart_left.signals(1).values;
end