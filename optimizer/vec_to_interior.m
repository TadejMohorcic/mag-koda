function [bx, by] = vec_to_interior(Bx, By, v)

n = size(Bx, 1);
interior_size = (n-2)*(n-3) / 2;

vx = v(1:interior_size);
vy = v(interior_size+1:end);

index = 1;
for i = 2:n
    for j = 2:n-i
        Bx(j, i) = vx(index);
        By(j, i) = vy(index);
        index = index + 1;
    end
end

bx = Bx;
by = By;

end