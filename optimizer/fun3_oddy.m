function O = fun3_oddy(Bx, By, U)

eps = 1e-5;

[bxu, byu, bxv, byv] = bezier3_der(Bx, By);

b1 = bezier3(bxu, byu, zeros(size(bxu)), U);
b2 = bezier3(bxv, byv, zeros(size(bxv)), U);

g11 = b1(:, 1).^2 + b1(:, 2).^2;
g22 = b2(:, 1).^2 + b2(:, 2).^2;
g12 = b1(:, 1).*b1(:, 2) + b2(:, 1).*b2(:, 2);

J = b1(:, 1).*b2(:, 2) - b1(:, 2).*b2(:, 1);

O = (g11.^2 + g22.^2 - g11.*g22 + 3*g12.^2) ./ (J.^2 + eps);

end