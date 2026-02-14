function [c, ceq] = opt_jacobiC(x_n, Bx1, By1, Bx2, By2, u, v)

[m, n] = size(Bx1);
[~, o] = size(Bx2);

interior_size1 = (m-2)*(n-2);
border_size = n-2;
interior_size2 = (m-2)*(o-2);

border_start = 2*interior_size1 + 1;
interior_start = border_start + 2*border_size;

interior_x1 = reshape(x_n(1:interior_size1), [m-2, n-2]);
interior_y1 = reshape(x_n(interior_size1+1:2*interior_size1), [m-2, n-2]);
border_x = reshape(x_n(border_start:border_start+border_size-1), [1, n-2]);
border_y = reshape(x_n(border_start+border_size:border_start+2*border_size-1), [1, n-2]);
interior_x2 = reshape(x_n(interior_start:interior_start+interior_size2-1), [m-2, o-2]);
interior_y2 = reshape(x_n(interior_start+interior_size2:interior_start+2*interior_size2-1), [m-2, o-2]);

Bx1(2:end-1, 2:end-1) = interior_x1;
By1(2:end-1, 2:end-1) = interior_y1;
Bx1(end, 2:end-1) = border_x;
By1(end, 2:end-1) = border_y;
Bx2(1, 2:end-1) = border_x;
By2(1, 2:end-1) = border_y;
Bx2(2:end-1, 2:end-1) = interior_x2;
By2(2:end-1, 2:end-1) = interior_y2;

J1 = -calculate_jacobi(Bx1, By1, u, v);
J2 = -calculate_jacobi(Bx2, By2, u, v);

J = [J1(:); J2(:)];

eps = 1e-5;
c = eps - J(:);
ceq = [];

end