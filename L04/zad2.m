% Zad.2

% Skalarna - każdej kombinacji liczb wejściowych odpowiada liczba
% rzeczywista, a nie wektor.
% Wypukła - Drugie pochodne są dodatnie.
% Nieujemna - suma dwóch kwadratów.
% Ciągła pochodna - pierwsze pochodne są ciągłe.

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