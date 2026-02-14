function v = interior_to_vec2(Bx, By)

n = size(Bx, 1);

vx = [];
vy = [];

for i = 2:n
    for j = 3:n-i
        vx = [vx; Bx(j, i)];
        vy = [vy; By(j, i)];
    end
end

v = [vx; vy];

end