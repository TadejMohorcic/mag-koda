function A = fun_area(Bx, By, u, v)

[bxu, byu, bxv, byv] = bezier2_der(Bx, By);

[bx1, by1, ~] = bezier2(bxu, byu, zeros(size(bxu)), u, v);
[bx2, by2, ~] = bezier2(bxv, byv, zeros(size(bxv)), u, v);

J = bx1.*by2 - bx2.*by1;

A = J.^2;

end