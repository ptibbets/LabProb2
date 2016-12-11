subplot(3,1,1)
plot(P1_Data.time, P1_Data.signals(1).values)
grid on
ylabel('Sterowanie')
subplot(3,1,2)
plot(P1_Data.time, P1_Data.signals(2).values)
grid on
ylabel('Pozycja wózka [m]')
subplot(3,1,3)
plot(P1_Data.time, P1_Data.signals(4).values)
grid on
ylabel('K¹t wahad³a [rad]')
xlabel('Czas [s]')
