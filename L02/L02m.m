clearvars;

function res = model(t, stan)
    x = stan(1);

    dxdt = x - 1;

    res = dxdt;
end

Wp = 0;
czas_sym = [0 1];

[t, sol] = ode45(@(t, stan) model(t, stan), czas_sym, Wp);

x = sol(:,1);

plot(t, x, 'b-', 'DisplayName', 'x(t)');

xlabel('Czas (t)');
ylabel('y');
legend('show');
grid on;