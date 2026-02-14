function [c, ceq] = opt3_jacobi(x_n, Bx, By, U)

[bx, by] = vec_to_interior(Bx, By, x_n);

J = calculate3_jacobi(bx, by, U);

eps = 1e-5;
c = eps - J;
ceq = [];

end