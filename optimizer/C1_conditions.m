function [bx, by] = C1_conditions(Bx1, By1, Bx2, By2)

n = size(Bx1, 1);

bx = Bx2;
by = By2;

for i = 1:n-1
    bx(2, i) = -Bx1(i, end-i) + Bx1(i, end-i+1) + Bx1(i+1, end-i);
    by(2, i) = -By1(i, end-i) + By1(i, end-i+1) + By1(i+1, end-i);
end

end