clearvars;

% zad.1
% Lyapunov stability of an equilibrium means that solutions starting 
% "close enough" to the equilibrium (within a distance δ from it) remain 
% "close enough" forever (within a distance ϵ from it). 
% Note that this must be true for any ϵ that one may want to choose.

% Asymptotic stability means that solutions that start close enough not 
% only remain close enough but also eventually converge to the equilibrium.

% Zad.2
[x1, x2] = meshgrid(-2:0.1:2, -2:0.1:2);
% Funkcja V(x1, x2) = x1^2 + x2^2
V = x1.^2 + x2.^2;

figure;
surf(x1, x2, V, 'EdgeColor', 'none')
colormap('jet');
%colorbar;
title('Funkcja Lapunowa V(x_1, x_2) = x_1^2 + x_2^2');
xlabel('x_1');
ylabel('x_2');
zlabel('V(x_1, x_2)');
hold on;

% Skalarna - każdej kombinacji liczb wejściowych odpowiada liczba
% rzeczywista, a nie wektor.
% Wypukła - Drugie pochodne są dodatnie.
% Nieujemna - suma dwóch kwadratów.
% Ciągła pochodna - pierwsze pochodne są ciągłe.

punkty_x1 = [1, 0, 1];
punkty_x2 = [0, 1, 1];
punkty_V = punkty_x1.^2 + punkty_x2.^2;

gradient_x1 = 2 * punkty_x1;
gradient_x2 = 2 * punkty_x2;
gradient_V = zeros(size(punkty_x1));

quiver3( ...
    punkty_x1, punkty_x2, punkty_V, ...
    gradient_x1, gradient_x2, gradient_V, ...
    'r', 'LineWidth', 1.5, 'MaxHeadSize', 0.5 ...
);
hold on;

% Zad.3
% Na zewnątrz
f_out_x1 = punkty_x1;
f_out_x2 = punkty_x2;
f_out_z = zeros(size(punkty_x1));
quiver3( ...
    punkty_x1, punkty_x2, punkty_V, ...
    f_out_x1, f_out_x2, f_out_z, ...
    'b', 'LineWidth', 1.5, 'MaxHeadSize', 0.5 ...
);

% Do środka
f_in_x1 = -punkty_x1;
f_in_x2 = -punkty_x2;
f_in_z = zeros(size(punkty_x1));
quiver3( ...
    punkty_x1, punkty_x2, punkty_V, ...
    f_in_x1, f_in_x2, f_in_z, ...
    'g', 'LineWidth', 1.5, 'MaxHeadSize', 0.5 ...
);

% Styczne
f_tan_x1 = -punkty_x2;
f_tan_x2 = punkty_x1;
f_tan_z = zeros(size(punkty_x1));
quiver3( ...
    punkty_x1, punkty_x2, punkty_V, ...
    f_tan_x1, f_tan_x2, f_tan_z, ...
    'm', 'LineWidth', 1.5, 'MaxHeadSize', 0.5 ...
);

legend('Powierzchnia', 'Gradient \nabla V', 'f(x) na zewnątrz', 'f(x) do środka', 'f(x) styczne');
grid on;
hold off;