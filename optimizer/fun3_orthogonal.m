function O = fun3_orthogonal(Bx, By, U)

[bxu, byu, bxv, byv] = bezier3_der(Bx, By);

b1 = bezier3(bxu, byu, zeros(size(bxu)), U);
b2 = bezier3(bxv, byv, zeros(size(bxv)), U);

g12 = b1(:, 1).*b1(:, 2) + b2(:, 1).*b2(:, 2);

O = g12.^2;
end