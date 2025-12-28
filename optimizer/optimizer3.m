function [bx, by] = optimizer3(x0, Bx, By, U, functional)

lb = zeros(size(x0));
ub = ones(size(x0));

opts = optimoptions('fmincon', 'Algorithm', 'interior-point', 'MaxIterations', 1e8, 'MaxFunctionEvaluations', 1e8);
x_opt = fmincon(@(x) optimizer3_functional(x, Bx, By, U, functional), x0, [], [], [], [], lb, ub, @(x) opt3_jacobi(x, Bx, By, U), opts);
[bx, by] = vec_to_interior(Bx, By, x_opt);

end