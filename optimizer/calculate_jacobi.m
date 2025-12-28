function J = calculate_jacobi(Bx, By, u, v)

[m, n] = size(Bx);

[bxu, byu, bxv, byv] = bezier2_der(Bx, By);

[bx1, by1, ~] = bezier2(bxu, byu, zeros(size(bxu)), u, v);
[bx2, by2, ~] = bezier2(bxv, byv, zeros(size(bxv)), u, v);

J = -(bx1.*by2 - by1.*bx2) / ((m-1) * (n-1));

end