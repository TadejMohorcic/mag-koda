function [bx1, by1, bx2, by2] = normalize_points2(Bx1, By1, Bx2, By2)

min_x = min(min(Bx1(:)), min(Bx2(:)));
max_x = max(max(Bx1(:)), max(Bx2(:)));
min_y = min(min(By1(:)), min(By2(:)));
max_y = max(max(By1(:)), max(By2(:)));

bx1 = (Bx1 - min_x)/(max_x - min_x);
by1 = (By1 - min_y)/(max_y - min_y);
bx2 = (Bx2 - min_x)/(max_x - min_x);
by2 = (By2 - min_y)/(max_y - min_y);

end