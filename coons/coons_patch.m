function [bx, by] = coons_patch(Bx, By)

[m, n] = size(Bx);

bx = zeros(m, n);
by = zeros(m, n);

for i = 1:m
    coef_i = (i - 1) / (m - 1);

    for j = 1:n
        coef_j = (j - 1) / (n - 1);
        
        bx1 = (1 - coef_i) * Bx(1, j) + coef_i * Bx(m, j);
        bx2 = (1 - coef_j) * Bx(i, 1) + coef_j * Bx(i, n);
        bx3 = [1 - coef_i coef_i] * [Bx(1, 1) Bx(1, n); Bx(m, 1) Bx(m, n)] * [1 - coef_j; coef_j];

        by1 = (1 - coef_i) * By(1, j) + coef_i * By(m, j);
        by2 = (1 - coef_j) * By(i, 1) + coef_j * By(i, n);
        by3 = [1 - coef_i coef_i] * [By(1, 1) By(1, n); By(m, 1) By(m, n)] * [1 - coef_j; coef_j];

        bx(i, j) = bx1 + bx2 - bx3;
        by(i, j) = by1 + by2 - by3;
    end
end

end