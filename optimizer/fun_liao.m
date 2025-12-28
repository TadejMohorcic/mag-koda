function L = fun_liao(Bx, By, u, v)

[bxu, byu, bxv, byv] = bezier2_der(Bx, By);

[bx1, by1, ~] = bezier2(bxu, byu, zeros(size(bxu)), u, v);
[bx2, by2, ~] = bezier2(bxv, byv, zeros(size(bxv)), u, v);

g11 = bx1.^2 + by1.^2;
g22 = bx2.^2 + by2.^2;
g12 = bx1.*bx2 + by1.*by2;

L = g11.^2 + 2*g12.^2 + g22.^2;

end