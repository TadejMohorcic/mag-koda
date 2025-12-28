function E = fun_eccentricity(Bx, By, u, v)

eps = 1e-5;

[bxu, byu, bxv, byv] = bezier2_der(Bx, By);

[bxuu, byuu, ~, ~] = bezier2_der(bxu, byu);
[~, ~, bxvv, byvv] = bezier2_der(bxv, byv);

[bx1, by1, ~] = bezier2(bxu, byu, zeros(size(bxu)), u, v);
[bx2, by2, ~] = bezier2(bxv, byv, zeros(size(bxv)), u, v);
[bx3, by3, ~] = bezier2(bxuu, byuu, zeros(size(bxuu)), u, v);
[bx5, by5, ~] = bezier2(bxvv, byvv, zeros(size(bxvv)), u, v);

g11 = bx1.^2 + by1.^2;
g22 = bx2.^2 + by2.^2;

c1 = bx1.*bx3 + by1.*by3;
c2 = bx2.*bx5 + by2.*by5;

E = (c1 ./ (g11 + eps)).^2 + (c2 ./ (g22 + eps)).^2;

end