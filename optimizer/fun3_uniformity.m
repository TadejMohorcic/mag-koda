function U = fun3_uniformity(Bx, By, U)

[bxu, byu, bxv, byv] = bezier3_der(Bx, By);

[bxuu, byuu, bxuv, byuv] = bezier3_der(bxu, byu);
[~, ~, bxvv, byvv] = bezier3_der(bxv, byv);

b3 = bezier3(bxuu, byuu, zeros(size(bxuu)), U);
b4 = bezier3(bxuv, byuv, zeros(size(bxuv)), U);
b5 = bezier3(bxvv, byvv, zeros(size(bxvv)), U);

a1 = b3(:, 1).^2 + b3(:, 2).^2;
a2 = b4(:, 1).^2 + b4(:, 2).^2;
a3 = b5(:, 1).^2 + b5(:, 2).^2;

U = a1 + 2*a2 + a3;

end