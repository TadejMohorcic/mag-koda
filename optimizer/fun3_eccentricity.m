function E = fun3_eccentricity(Bx, By, U)

[bxu, byu, bxv, byv] = bezier3_der(Bx, By);

[bxuu, byuu, ~, ~] = bezier3_der(bxu, byu);
[~, ~, bxvv, byvv] = bezier3_der(bxv, byv);

b1 = bezier3(bxu, byu, zeros(size(bxu)), U);
b2 = bezier3(bxv, byv, zeros(size(bxv)), U);
b3 = bezier3(bxuu, byuu, zeros(size(bxuu)), U);
b5 = bezier3(bxvv, byvv, zeros(size(bxvv)), U);


g11 = b1(:, 1).^2 + b1(:, 2).^2;
g22 = b2(:, 1).^2 + b2(:, 2).^2;

c1 = b1(:, 1).*b3(:, 1) + b1(:, 2).*b3(:, 2);
c2 = b2(:, 1).*b5(:, 1) + b2(:, 2).*b5(:, 2);

E =  (c1 ./ (g11 + eps)).^2 + (c2 ./ (g22 + eps)).^2;

end