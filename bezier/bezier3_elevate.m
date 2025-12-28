function [bx, by, bz] = bezier3_elevate(Bx, By, Bz, m)

n = size(Bx, 1);

bx = NaN(n+m);
by = NaN(n+m);
bz = NaN(n+m);

for i = 1:n+m
    for j = 1:n+m-i+1

        binom_matrix = zeros(n);

        for a = 1:n
            for b = 1:n
                binom_matrix(a, b) = (binom(i-1,a-1) * binom(j-1, b-1) * binom(n+m-i-j+1, n-a-b+1))/binom(n+m-1, n-1);
            end
        end

        bx(i, j) = sum(binom_matrix.*nan_to_zero(Bx), 'all');
        by(i, j) = sum(binom_matrix.*nan_to_zero(By), 'all');
        bz(i, j) = sum(binom_matrix.*nan_to_zero(Bz), 'all');

    end
end

end