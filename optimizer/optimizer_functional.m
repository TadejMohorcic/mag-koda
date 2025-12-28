function integral_value = optimizer_functional(x_n, Bx, By, u, v, functional)

[m, n] = size(Bx);
interior_size = (m-2)*(n-2);

interior_x = reshape(x_n(1:interior_size), [m-2, n-2]);
interior_y = reshape(x_n(interior_size+1:end), [m-2, n-2]);

Bx(2:end-1, 2:end-1) = interior_x;
By(2:end-1, 2:end-1) = interior_y;

I = functional(Bx, By, u, v);

integral_value = trapz(u, trapz(v, I, 1), 2) / ((m-1) * (n-1));

end