function U = fun_uniformity(Bx, By, u, v)

[bxu, byu, bxv, byv] = bezier2_der(Bx, By);

[bxuu, byuu, bxuv, byuv] = bezier2_der(bxu, byu);
[~, ~, bxvv, byvv] = bezier2_der(bxv, byv);

[bx3, by3, ~] = bezier2(bxuu, byuu, zeros(size(bxuu)), u, v);
[bx4, by4, ~] = bezier2(bxuv, byuv, zeros(size(bxuv)), u, v);
[bx5, by5, ~] = bezier2(bxvv, byvv, zeros(size(bxvv)), u, v);

a1 = bx3.^2 + by3.^2;
a2 = bx4.^2 + by4.^2;
a3 = bx5.^2 + by5.^2;

U = a1 + 2*a2 + a3;

end