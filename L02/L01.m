clearvars;

function res = model(t, stan, a, b, c, d)
    x = stan(1);
    y = stan(2);

    dxdt = x * (a - b * y);
    dydt = y * (-d + c * x);

    res = [dxdt; dydt];
end

% Parametry
a = 0.5; % tempo wzrostu populacji ofiar
b = 3; % tempo zjadania ofiar przez drapieżniki
c = 1; % tempo umierania drapieżników
d = 0.5; % tempo wzrostu populacji drapieżników

Wp = [2; 1]; % Startowa populacja [ofiary; drapieżniki]
czas_sym = [0 100]; % Przedział czasowy

[t, sol] = ode45(@(t, stan) model(t, stan, a, b, c, d), czas_sym, Wp);

x = sol(:,1);
y = sol(:,2);

plot(t, x, 'b-', 'DisplayName', 'Ofiary');
hold on;
plot(t, y, 'r-', 'DisplayName', 'Drapieżniki');
hold off;

xlabel('Czas (t)');
ylabel('Populacja');
legend('show');
grid on;