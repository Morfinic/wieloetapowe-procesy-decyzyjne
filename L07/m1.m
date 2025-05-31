clear vars;
clc;

% Parametry zadania
n = 6;
K = 10;
xa = 2;

c = [4, 2, 5, 3, 4, 2];
v = [6, 7, 4, 2, 4, 3];

phi = inf(n+1, K+1);
phi(n+1, :) = 0;

for j = n:-1:1
    for xj = 0:K
        minU = max(0, v(j) - xj);
        maxU = min(K, K - xj);
        minCost = inf;
        for uj = minU:maxU
            x_next = xj + uj - v(j);
            if x_next >= 0 && x_next <= K
                cost = c(j)*uj + phi(j+1, x_next+1);
                if cost < minCost
                    minCost = cost;
                end
            end
        end
        phi(j, xj+1) = minCost;
    end
end

x = zeros(1, n+1);
x(1) = xa;
u = zeros(1, n);

for j = 1:n
    xj = x(j);
    minU = max(0, v(j) - xj);
    maxU = min(K, K - xj);
    bestU = 0;
    bestCost = inf;
    for uj = minU:maxU
        x_next = xj + uj - v(j);
        if x_next >= 0 && x_next <= K
            cost = c(j)*uj + phi(j+1, x_next+1);
            if cost < bestCost
                bestCost = cost;
                bestU = uj;
            end
        end
    end
    u(j) = bestU;
    x(j+1) = x(j) + bestU - v(j);
end

disp('Optymalna strategia (u*):');
disp(u);
