function [bxu, byu, bxv, byv] = bezier2_der(Bx, By)

[n, m] = size(Bx);

bxu = (n - 1) * diff(Bx, 1, 1);
byu = (n - 1) * diff(By, 1, 1);

bxv = (m - 1) * diff(Bx, 1, 2);
byv = (m - 1) * diff(By, 1, 2);

end