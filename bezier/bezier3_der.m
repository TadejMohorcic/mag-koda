function [bxu, byu, bxv, byv] = bezier3_der(Bx, By)

n = size(Bx, 1) - 1;

bxu = -n * diff(Bx, 1, 2);
byu = -n * diff(By, 1, 2);

bxu = bxu(1:end-1, :);
byu = byu(1:end-1, :);

bxv = NaN(n);
byv = NaN(n);

for i = 1:n
    for j = 1:n-i+1
        bxv(i, j) = n * (Bx(i+1, j) - Bx(i, j+1));
        byv(i, j) = n * (By(i+1, j) - By(i, j+1));
    end
end

end