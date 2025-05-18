clearvars;
clc;

%%
sigma = 10;
b = 8/3;

syms x y z r

eq1 = sigma * y - sigma * x;
eq2 = -x * z + r * x - y;
eq3 = x * y - b * z;

equations = [eq1 == 0, eq2 == 0, eq3 == 0];

sol = solve(equations, [x y z], ReturnConditions=true);

disp('x = '); disp(sol.x);
disp('y = '); disp(sol.y);
disp('z = '); disp(sol.z);

%%
J = [
    -sigma, sigma, 0;
    r - z, -1, -x;
    y, x, -b
];

for r_val = 2:1:30
    x_val = double(subs(sol.x, r, r_val));
    y_val = double(subs(sol.y, r, r_val));
    z_val = double(subs(sol.z, r, r_val));

    fprintf("Punkty stabilności dla r = %d\n", r_val);
    for i = 1:length(x_val)
        fprintf("Punkt: %d: (x,y,z) = (%.4f, %.4f, %.4f)\n", i, x_val(i), y_val(i), z_val(i));

        if ~isreal(x_val(i)) || ~isreal(y_val(i)) || ~isreal(z_val(i))
            fprintf("Punkt nie jest rzeczywisty.")
            continue
        end

        J_new = double(subs(J, {x, y, z, r}, {x_val(i), y_val(i), z_val(i), r_val}));

        eigen_val = eig(J_new);
        fprintf("\tWartości własne: \n")
        for j = 1:length(eigen_val)
            fprintf("\t\t%.4f%+.4fi\n", real(eigen_val(j)), imag(eigen_val(j)))
        end

        fprintf("\t\tStabilność: ")

        if all(real(eigen_val) < 0)
            fprintf("Stabilny\n")
        elseif any(real(eigen_val) > 0)
            fprintf("Niestabilny\n")
        else
            fprintf("Wymagana dalsza analiza\n")
        end
    end
end

