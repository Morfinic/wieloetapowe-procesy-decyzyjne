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

<<<<<<< HEAD
Wp = [0; 0.5; 1];
czas_sym = [100 500];
=======
%% Zad 1

Wp = [
    0; 
    0.5; 
    1
];
czas_sym = [0 1000];
>>>>>>> 657279fb64e480e94c9aa972686dfe235a63a194

delta = 10;
r = 28;
b = 8/3;

[t, sol] = ode45(@(t, stan) model(t, stan, delta, r, b), czas_sym, Wp);

x = sol(:,1);
y = sol(:,2);
z = sol(:,3);

figure;
plot3(x, y, z, 'LineWidth', 1.5)

xlabel('x');
ylabel('y');
zlabel('z');
grid on;
hold on;

%% Zad 2

Wp = [
    0; 
    -0.5; 
    1
];

%[t, sol] = ode45(@(t, stan) model(t, stan, delta, r, b), czas_sym, Wp);

%x = sol(:,1);
%y = sol(:,2);
%z = sol(:,3);

%plot3(x, y, z, 'LineWidth', 1.5)

%xlabel('x');
%ylabel('y');
%zlabel('z');
%hold on;