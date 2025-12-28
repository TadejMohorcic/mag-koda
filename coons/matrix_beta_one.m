function M = matrix_beta_one(beta, n)

M = diag(ones(1, n)) + diag(repmat(-beta, 1, n - 1), 1) + diag(repmat(-beta, 1, n-1), -1);

end