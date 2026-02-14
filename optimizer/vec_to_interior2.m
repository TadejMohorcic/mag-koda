function [bx, by] = vec_to_interior2(Bx, By, v)

n = size(Bx, 1);
interior_size = (n-3)*(n-4) / 2;

vx = v(1:interior_size);
vy = v(interior_size+1:end);

bx = Bx;
by = By;

index = 1;
for i = 2:n
    for j = 3:n-i
        bx(j, i) = vx(index);
        by(j, i) = vy(index);
        index = index + 1;
    end
end

end