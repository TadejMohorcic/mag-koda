function [bx, by] = coons_tri_patch(Bx, By)

n = size(Bx, 1);

bx = NaN(n+1);
by = NaN(n+1);

for i = 1:n+1
    index_j = i-1;
    
    for j = 1:n+2-i
        index_k = j-1;
        index_i = n - index_j - index_k;
        
        if index_i == 0
            bx1 = 0;
            by1 = 0;
        else
            bx1 = index_i / n * (Bx(1, j) + Bx(i, 1) - Bx(1, 1));
            by1 = index_i / n * (By(1, j) + By(i, 1) - By(1, 1));
        end

        if index_j == 0
            bx2 = 0;
            by2 = 0;
        else
            bx2 = index_j / n * (Bx(j + (i-2), 1) + Bx(n+1-j, j) - Bx(n, 1));
            by2 = index_j / n * (By(j + (i-2), 1) + By(n+1-j, j) - By(n, 1));
        end

        if index_k == 0
            bx3 = 0;
            by3 = 0;
        else
            bx3 = index_k / n * (Bx(1, i + (j-2)) + Bx(i, n+1-i) - Bx(1, n));
            by3 = index_k / n * (By(1, i + (j-2)) + By(i, n+1-i) - By(1, n));
        end

        bx(i, j) = bx1 + bx2 + bx3;
        by(i, j) = by1 + by2 + by3;
    end
end

end