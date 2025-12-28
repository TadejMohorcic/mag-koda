function [bx, by] = optimizer(x0, Bx, By, u, v, functional)

[m, n] = size(Bx);
interior_size = (m-2)*(n-2);

opts = optimoptions('fmincon', 'Algorithm', 'interior-point', 'MaxIterations', 1e5, 'MaxFunctionEvaluations', 1e5);
x_opt = fmincon(@(x) optimizer_functional(x, Bx, By, u, v, functional), x0, [], [], [], [], [], [], @(x) opt_jacobi(x, Bx, By, u, v), opts);

opt_x = reshape(x_opt(1:interior_size), [m-2, n-2]);
opt_y = reshape(x_opt(interior_size+1:end), [m-2, n-2]);

bx = Bx;
by = By;

bx(2:end-1, 2:end-1) = opt_x;
by(2:end-1, 2:end-1) = opt_y;

end