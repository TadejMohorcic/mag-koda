function J = calculate3_jacobi(Bx, By, U)

n = size(Bx, 1);

[bxu, byu, bxv, byv] = bezier3_der(Bx, By);

b1 = bezier3(bxu, byu, zeros(size(bxu)), U);
b2 = bezier3(bxv, byv, zeros(size(bxv)), U);

J = -(b1(:, 1).*b2(:, 2) - b2(:, 1).*b1(:,2)) / ((n-1)*(n-1));

end