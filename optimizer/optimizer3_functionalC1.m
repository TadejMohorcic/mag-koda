function integral_value = optimizer3_functionalC1(x_n, Bx1, By1, Bx2, By2, U, functional)

n = size(Bx1, 1);
interior_size1 = (n-2)*(n-3) / 2;
interior_size2 = (n-3)*(n-4) / 2;

inner1 = x_n(1:2*interior_size1);
inner2 = x_n(end-2*interior_size2+1:end);
border = x_n(2*interior_size1 + 1:end-2*interior_size2);

[bx1, by1] = vec_to_interior(Bx1, By1, inner1);
[bx2, by2] = vec_to_interior2(Bx2, By2, inner2);

[bx1, by1, bx2, by2] = vec_to_border2(bx1, by1, bx2, by2, border);

[bx2, by2] = C1_conditions(bx1, by1, bx2, by2);

I1 = functional(bx1, by1, U);
I2 = functional(bx2, by2, U);

integral_value = sum(I1(:)) / n + sum(I2(:)) / n;

end