clearvars;

function res = model(t, stan)
    x = stan(1);
    y = stan(2);

    dxdt = x - 1;
    dydt = y - 1;

    res = [dxdt; dydt];
end

Wp = [0; 1];
czas_sym = [0 1];

[t, sol] = ode45(@(t, stan) model(t, stan), czas_sym, Wp);

x = sol(:,1);
y = sol(:,2);

plot(t, x, 'b-', 'DisplayName', 'x(t)');
hold on;
plot(t, y, 'r-', 'DisplayName', 'y(t)');
hold off;

xlabel('Czas (t)');
ylabel('y');
legend('show');
grid on;