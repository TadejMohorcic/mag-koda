function O = fun_oddy(Bx, By, u, v)

eps = 1e-5;

[bxu, byu, bxv, byv] = bezier2_der(Bx, By);

[bx1, by1, ~] = bezier2(bxu, byu, zeros(size(bxu)), u, v);
[bx2, by2, ~] = bezier2(bxv, byv, zeros(size(bxv)), u, v);

g11 = bx1.^2 + by1.^2;
g12 = bx1.*bx2 + by1.*by2;
g22 = bx2.^2 + by2.^2;

J = bx1.*by2 - bx2.*by1;

O = (g11.^2 + g22.^2 - g11.*g22 + 3*g12.^2) ./ (J.^2 + eps);

end