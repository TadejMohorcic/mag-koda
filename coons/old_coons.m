function [bx, by] = coons_tri_patch(Bx, By)

n = size(Bx, 1);

bx = Bx;
by = By;

for i = 2:n-1
    index_j = i-1;

    for j = 2:n-i
        index_k = j-1;
        index_i = (n - 1) - index_j - index_k;

        bx1 = index_i / (n - 1) * (bx(1,j) + bx(i, 1) - bx(1,1));
        bx2 = index_j / (n - 1) * (bx(n + 1 - j, j) + bx(i + j - 1, 1) - bx(n, 1));
        bx3 = index_k / (n - 1) * (bx(i, n + 1 - i) + bx(1, j + i - 1) - bx(1, n));

        by1 = index_i / (n - 1) * (by(1,j) + by(i, 1) - by(1,1));
        by2 = index_j / (n - 1) * (by(n + 1 - j, j) + by(i + j - 1, 1) - by(n, 1));
        by3 = index_k / (n - 1) * (by(i, n + 1 - i) + by(1, j + i - 1) - by(1, n));

        bx(i, j) = bx1 + bx2 + bx3;
        by(i, j) = by1 + by2 + by3;
    end
end

end