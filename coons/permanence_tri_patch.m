function [bx, by] = permanence_tri_patch(Bx, By, alpha)

beta = (1 - 3 * alpha) / 6;

n = size(Bx, 1);

bx = Bx;
by = By;

for i = 2:n-1
    for j = 2:n-i
        bx(i, j) = 0;
        by(i, j) = 0;
    end
end

system_matrix = matrix_system(alpha, beta, n - 3);

mask = [alpha beta beta alpha; beta 0 beta 0; beta beta 0 0; alpha 0 0 0];

left_side_x = zeros((n - 2) * (n - 3) / 2, 1);
left_side_y = zeros((n - 2) * (n - 3) / 2, 1);

index = 1;

for i = 2:n-1
        for j = 2:n-i
            window_x = bx(i-1:i+2, j-1:j+2);
            window_y = by(i-1:i+2, j-1:j+2);
            
            left_side_x(index) = sum(sum(mask .* nan_to_zero(window_x)));
            left_side_y(index) = sum(sum(mask .* nan_to_zero(window_y)));

            index = index + 1;
        end
    end

bx_inner = system_matrix \ left_side_x;
by_inner = system_matrix \ left_side_y;

final_index = 1;

for i = 2:n-1
        for j = 2:n-i
            bx(i, j) = bx_inner(final_index);
            by(i, j) = by_inner(final_index);

            final_index = final_index + 1;
        end
    end

end