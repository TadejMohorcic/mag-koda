function M = matrix_system(alpha, beta, n)

if n == 1
    M = 1;
elseif n == 2
    M1 = matrix_beta_one(beta, n);
    M2 = matrix_beta(beta, n);
    M3 = matrix_alpha_beta(alpha, beta, n - 1);
    M4 = matrix_beta_one(beta, n - 1);

    M = [M1 M2; M3 M4];
else
    M1 = matrix_beta_one(beta, n);
    M2 = matrix_beta(beta, n);
    M3 = matrix_alpha(alpha, n);
    M4 = matrix_alpha_beta(alpha, beta, n - 1);
    M5 = matrix_system(alpha, beta, n - 1);

    additional_matrix_below = zeros((n - 2) * (n - 1) / 2, n);

    if n <= 3
        additional_matrix_right = [];
    else
        additional_matrix_right = zeros(n, (n - 3) * (n - 2) / 2);
    end

    M = [M1 M2 M3 additional_matrix_right; [M4; additional_matrix_below] M5];
end

end