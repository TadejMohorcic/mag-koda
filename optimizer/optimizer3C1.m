function [bx1, by1, bx2, by2] = optimizer3C1(x0, Bx1, By1, Bx2, By2, U, functional)

opts = optimoptions('fmincon', 'Algorithm', 'interior-point', 'MaxIterations', 1e5, 'MaxFunctionEvaluations', 1e5);
x_opt = fmincon(@(x) optimizer3_functionalC1(x, Bx1, By1, Bx2, By2, U, functional), x0, [], [], [], [], [], [], @(x) opt3_jacobiC1(x, Bx1, By1, Bx2, By2, U), opts);

n = size(Bx1, 1);
interior_size1 = (n-2)*(n-3) / 2;
interior_size2 = (n-3)*(n-4) / 2;

inner1 = x_opt(1:2*interior_size1);
inner2 = x_opt(end-2*interior_size2+1:end);
border = x_opt(2*interior_size1 + 1:end-2*interior_size2);

[bx1, by1] = vec_to_interior(Bx1, By1, inner1);
[bx2, by2] = vec_to_interior2(Bx2, By2, inner2);

[bx1, by1, bx2, by2] = vec_to_border2(bx1, by1, bx2, by2, border);

[bx2, by2] = C1_conditions(bx1, by1, bx2, by2);

end