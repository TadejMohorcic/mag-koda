function [bx1, by1, bx2, by2] = vec_to_border2(Bx1, By1, Bx2, By2, v)

n = size(Bx1, 1);
border_size = n - 4;

border_x = v(1:border_size);
border_y = v(border_size+1:end);

j = 1;

for i = 3:3+border_size-1
    Bx1(i, n-i+1) = border_x(j);
    By1(i, n-i+1) = border_y(j);
    
    Bx2(1, i) = border_x(j);
    By2(1, i) = border_y(j);

    j = j + 1;
end

bx1 = Bx1;
by1 = By1;
bx2 = Bx2;
by2 = By2;

end