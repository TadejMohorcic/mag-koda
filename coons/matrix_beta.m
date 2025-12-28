function M = matrix_beta(beta, n)

M = diag(repmat(-beta, 1, n)) + diag(repmat(-beta, 1, n - 1), 1);

M = M(:, 2:end);

end