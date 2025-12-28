function [c, ceq] = opt_jacobi(x_n, Bx, By, u, v)

[m, n] = size(Bx);
interior_size = (m-2)*(n-2);

interior_x = reshape(x_n(1:interior_size), [m-2, n-2]);
interior_y = reshape(x_n(interior_size+1:end), [m-2, n-2]);

Bx(2:end-1, 2:end-1) = interior_x;
By(2:end-1, 2:end-1) = interior_y;

J = calculate_jacobi(Bx, By, u, v);

eps = 1e-5;
c = eps - J(:);
ceq = [];

end