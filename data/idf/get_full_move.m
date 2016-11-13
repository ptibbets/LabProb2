function [ t, x, u ] = get_full_move()
    load('idf_full.mat')
    t = idf_full.time;
    x1 = idf_full.signals(1).values;
    x2 = idf_full.signals(2).values;
    x4 = idf_full.signals(4).values;
    off = 1000;
    t = t(off:length(t));
    x = [x4(off:length(x4)), x2(off:length(x2)) - pi];
    u = x1(off:length(x1));
end