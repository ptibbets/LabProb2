model_prep

x_0 = [0 0 1 0];
sim('model_ver_model')

c = [M a];
rhs = @(t,x) [ ...
    x(2,:); ...
    (-m*l*l.*(x(4,:).^2).*sin(x(3,:)) + m*l*g.*sin(x(3,:)).*cos(x(3,:)) - b.*(tanh(t*x(4,:))*abs(x(4,:)).^w).*cos(x(3,:)) - c(2)*l.*x(2,:))./((c(1)+m)*l-m*l.*(cos(x(3,:)).^2)); ...
    x(4,:); ...
    ((c(1)+m)*g.*sin(x(3,:)) - m*l.*(x(4,:).^2).*sin(x(3,:)).*cos(x(3,:)) - c(2).*x(2,:).*cos(x(3,:)) - ((c(1)+m)*b/(m*l)).*(tanh(t*x(4,:))*abs(x(4,:)).^w))./((c(1)+m)*l-m*l.*(cos(x(3,:)).^2)) ...
    ];

[tm, xm] = ode45(rhs, 0:0.001:60, x_0);

figure
plot(P1_Data.time, P1_Data.signals(4).values, tm, xm(:,3))
figure
plot(P1_Data.time, P1_Data.signals(2).values, tm, xm(:,1))

