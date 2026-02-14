function integral_value = optimizer3_functionalC(x_n, Bx1, By1, Bx2, By2, U, functional)

n = size(U, 1);

n = size(Bx1, 1);
interior_size = (n-2)*(n-3) / 2;

inner1 = x_n(1:2*interior_size);
inner2 = x_n(end-2*interior_size+1:end);
border = x_n(2*interior_size + 1:end-2*interior_size);

[bx1, by1] = vec_to_interior(Bx1, By1, inner1);
[bx2, by2] = vec_to_interior(Bx2, By2, inner2);

[bx1, by1, bx2, by2] = vec_to_border(bx1, by1, bx2, by2, border);

I1 = functional(bx1, by1, U);
I2 = functional(bx2, by2, U);

integral_value = sum(I1(:)) / n + sum(I2(:)) / n;

end