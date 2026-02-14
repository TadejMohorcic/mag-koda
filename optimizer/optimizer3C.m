function [bx1, by1, bx2, by2] = optimizer3C(x0, Bx1, By1, Bx2, By2, U, functional)

opts = optimoptions('fmincon', 'Algorithm', 'interior-point', 'MaxIterations', 1e5, 'MaxFunctionEvaluations', 1e5);
x_opt = fmincon(@(x) optimizer3_functionalC(x, Bx1, By1, Bx2, By2, U, functional), x0, [], [], [], [], [], [], @(x) opt3_jacobiC(x, Bx1, By1, Bx2, By2, U), opts);

n = size(Bx1, 1);
interior_size = (n-2)*(n-3) / 2;

inner1 = x_opt(1:2*interior_size);
inner2 = x_opt(end-2*interior_size+1:end);
border = x_opt(2*interior_size + 1:end-2*interior_size);

[bx1, by1] = vec_to_interior(Bx1, By1, inner1);
[bx2, by2] = vec_to_interior(Bx2, By2, inner2);

[bx1, by1, bx2, by2] = vec_to_border(bx1, by1, bx2, by2, border);

end