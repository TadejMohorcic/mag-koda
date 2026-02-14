function [bx1, by1, bx2, by2] = optimizerC(x0, Bx1, By1, Bx2, By2, u, v, functional)

[m, n] = size(Bx1);
[~, o] = size(Bx2);

interior_size1 = (m-2)*(n-2);
border_size = n-2;
interior_size2 = (m-2)*(o-2);

border_start = 2*interior_size1 + 1;
interior_start = border_start + 2*border_size;

opts = optimoptions('fmincon', 'Algorithm', 'interior-point', 'MaxIterations', 1e5, 'MaxFunctionEvaluations', 1e5);
x_opt = fmincon(@(x) optimizer_functionalC(x, Bx1, By1, Bx2, By2, u, v, functional), x0, [], [], [], [], [], [], @(x) opt_jacobiC(x, Bx1, By1, Bx2, By2, u, v), opts);

interior_x1 = reshape(x_opt(1:interior_size1), [m-2, n-2]);
interior_y1 = reshape(x_opt(interior_size1+1:2*interior_size1), [m-2, n-2]);
border_x = reshape(x_opt(border_start:border_start+border_size-1), [1, n-2]);
border_y = reshape(x_opt(border_start+border_size:border_start+2*border_size-1), [1, n-2]);
interior_x2 = reshape(x_opt(interior_start:interior_start+interior_size2-1), [m-2, o-2]);
interior_y2 = reshape(x_opt(interior_start+interior_size2:interior_start+2*interior_size2-1), [m-2, o-2]);

bx1 = Bx1;
by1 = By1;
bx2 = Bx2;
by2 = By2;

bx1(2:end-1, 2:end-1) = interior_x1;
by1(2:end-1, 2:end-1) = interior_y1;
bx1(end, 2:end-1) = border_x;
by1(end, 2:end-1) = border_y;
bx2(1, 2:end-1) = border_x;
by2(1, 2:end-1) = border_y;
bx2(2:end-1, 2:end-1) = interior_x2;
by2(2:end-1, 2:end-1) = interior_y2;

end