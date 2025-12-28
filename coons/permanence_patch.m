function [bx, by] = permanence_patch(Bx, By, alpha)

beta = (1 - 4 * alpha) / 4;

[m, n] = size(Bx);

bx = Bx;
by = By;

bx(2:m-1, 2:n-1) = 0;
by(2:m-1, 2:n-1) = 0;

main_diagonal_block = diag(ones(1, m - 2)) + diag(repmat(-beta, 1, m - 3), 1) + diag(repmat(-beta, 1, m - 3), -1);
side_diagonal_block = diag(repmat(-beta, 1, m - 2)) + diag(repmat(-alpha, 1, m - 3), 1) + diag(repmat(-alpha, 1, m - 3), -1);

I = eye(n - 2);
U = diag(ones(n - 3, 1), 1);
L = diag(ones(n - 3, 1), -1);

system_matrix = kron(I, main_diagonal_block) + kron(U, side_diagonal_block) + kron(L, side_diagonal_block);

mask = [alpha beta alpha; beta 0 beta; alpha beta alpha];

left_side_x = zeros((m - 2) * (n - 2), 1);
left_side_y = zeros((m - 2) * (n - 2), 1);

index = 1;

for j = 2:n-1
    for i = 2:m-1
        window_x = bx(i-1:i+1, j-1:j+1);
        window_y = by(i-1:i+1, j-1:j+1);

        left_side_x(index) = sum(sum(mask .* window_x));
        left_side_y(index) = sum(sum(mask .* window_y));
        index = index + 1;
    end
end

bx_inner = system_matrix \ left_side_x;
by_inner = system_matrix \ left_side_y;

bx(2:m-1, 2:n-1) = reshape(bx_inner, [m - 2, n - 2]);
by(2:m-1, 2:n-1) = reshape(by_inner, [m - 2, n - 2]);

end