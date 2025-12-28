function M = matrix_alpha(alpha, n)

M = diag(repmat(-alpha, 1, n));
M = M(:, 2:end-1);

end