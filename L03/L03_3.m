clearvars;

function res = model(t, stan, delta, r, b)
    x = stan(1);
    y = stan(2);
    z = stan(3);

    dxdt = delta * y - delta * x;
    dydt = -x * z + r * x - y;
    dzdt = x * y - b * z;

    res = [dxdt; dydt; dzdt];
end

Wp = [
    0; 
    0.5; 
    1
];
czas_sym = [0 100];

delta = 10;
r = 28;
b = 8/3;

[t, sol] = ode45(@(t, stan) model(t, stan, delta, r, b), czas_sym, Wp);

t1 = t;
x1 = sol(:,1);
y1 = sol(:,2);
z1 = sol(:,3);

Wp = [
    0; 
    -0.5; 
    -1
];

[t, sol] = ode45(@(t, stan) model(t, stan, delta, r, b), czas_sym, Wp);

t2 = t;
x2 = sol(:,1);
y2 = sol(:,2);
z2 = sol(:,3);

figure;
plot(t1, x1, 'LineWidth', 1.5)
hold on;
plot(t2, x2, 'LineWidth', 1.5)
grid on;
title('x')

figure;
plot(t1, y1, 'LineWidth', 1.5)
hold on;
plot(t2, y2, 'LineWidth', 1.5)
grid on;
title('y')

figure;
plot(t1, z1, 'LineWidth', 1.5)
hold on;
plot(t2, z2, 'LineWidth', 1.5)
grid on;
title('z')