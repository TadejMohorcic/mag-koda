function M = matrix_alpha_beta(alpha, beta, n)

M = diag(repmat(-beta, 1, n + 1)) + diag(repmat(-beta, 1, n), 1) + diag(repmat(-alpha, 1, n), -1) + diag(repmat(-alpha, 1, n - 1), 2);

M = M(1:end-1, :);

end