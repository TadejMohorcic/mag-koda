function integral_value = optimizer3_functional(x0, Bx, By, U, functional)

n = size(U, 1);

[bx, by] = vec_to_interior(Bx, By, x0);

I = functional(bx, by, U);

integral_value = sum(I(:)) / n;

end