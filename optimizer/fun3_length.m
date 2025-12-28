function L = fun3_length(Bx, By, U)

[bxu, byu, bxv, byv] = bezier3_der(Bx, By);

b1 = bezier3(bxu, byu, zeros(size(bxu)), U);
b2 = bezier3(bxv, byv, zeros(size(bxv)), U);

g11 = b1(:, 1).^2 + b1(:, 2).^2;
g22 = b2(:, 1).^2 + b2(:, 2).^2;

L = g11 + g22;

end