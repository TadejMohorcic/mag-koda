function integral_value = optimizer_functionalC1(x_n, Bx1, By1, Bx2, By2, u, v, functional)

[m, n] = size(Bx1);
[o, ~] = size(Bx2);

interior_size1 = (m-2)*(n-2);
border_size = n-2;
interior_size2 = (o-3)*(n-2);

border_start = 2*interior_size1 + 1;
interior_start = border_start + 2*border_size;

interior_x1 = reshape(x_n(1:interior_size1), [m-2, n-2]);
interior_y1 = reshape(x_n(interior_size1+1:2*interior_size1), [m-2, n-2]);
border_x = reshape(x_n(border_start:border_start+border_size-1), [1, n-2]);
border_y = reshape(x_n(border_start+border_size:border_start+2*border_size-1), [1, n-2]);
interior_x2 = reshape(x_n(interior_start:interior_start+interior_size2-1), [o-3, n-2]);
interior_y2 = reshape(x_n(interior_start+interior_size2:interior_start+2*interior_size2-1), [o-3, n-2]);

Bx1(2:end-1, 2:end-1) = interior_x1;
By1(2:end-1, 2:end-1) = interior_y1;
Bx1(end, 2:end-1) = border_x;
By1(end, 2:end-1) = border_y;
Bx2(1, 2:end-1) = border_x;
By2(1, 2:end-1) = border_y;
Bx2(3:end-1, 2:end-1) = interior_x2;
By2(3:end-1, 2:end-1) = interior_y2;

Bx2(2,2:end-1) = 2 * Bx1(end,2:end-1) - Bx1(end-1,2:end-1);
By2(2,2:end-1) = 2 * By1(end,2:end-1) - By1(end-1,2:end-1);

I1 = functional(Bx1, By1, u, v);
I2 = functional(Bx2, By2, u, v);

integral_value = trapz(u, trapz(v, I1, 1), 2) + trapz(u, trapz(v, I2, 1), 2);

end