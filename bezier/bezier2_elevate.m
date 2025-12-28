function [bx, by, bz] = bezier2_elevate(Bx, By, Bz, k, l)

[m, n] = size(Bx);

bx = zeros(m+k, n+l);
by = zeros(m+k, n+l);
bz = zeros(m+k, n+l);

for i = 1:size(bx, 1)
    for j = 1:size(bx, 2)

        binom_matrix = zeros(m, n);

        for a = 1:m
            for b = 1:n
                binom_matrix(a, b) = (binom(m-1, a-1)*binom(k, i-a)/binom(m-1+k, i-1)) * (binom(n-1, b-1)*binom(l, j-b)/binom(n+l-1, j-1));
            end
        end

        bx(i, j) = sum(binom_matrix.*Bx, 'all');
        by(i, j) = sum(binom_matrix.*By, 'all');
        bz(i, j) = sum(binom_matrix.*Bz, 'all');
    end
end

end