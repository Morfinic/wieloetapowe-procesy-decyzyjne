clearvars;
clc;

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
   [0.00001 0 0]; [0.00001 0 0]
];
czas_sym = [
    [0 50]; [0 50];
];

delta = 10;
r = [0.5; 1];
b = 8/3;

figure;

for i = 1:length(r)
    [t, sol] = ode45(@(t, stan) model(t, stan, delta, r(i), b), czas_sym(i,:), Wp(i,:));
    
    x = sol(:,1);
    y = sol(:,2);
    z = sol(:,3);
    
    subplot(2, 1, i);
    plot3(x, y, z, 'b-', 'LineWidth', 1);
    grid on;
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title(r(i))
end
