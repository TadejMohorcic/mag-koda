function v = interior_to_vec(Bx, By)

n = size(Bx, 1);

vx = [];
vy = [];

for i = 2:n
    for j = 2:n-i
        vx = [vx; Bx(j, i)];
        vy = [vy; By(j, i)];
    end
end

v = [vx; vy];

end