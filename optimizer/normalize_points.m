function [bx, by] = normalize_points(Bx, By)

min_x = min(Bx(:));
max_x = max(Bx(:));
min_y = min(By(:));
max_y = max(By(:));

bx = (Bx - min_x)/(max_x - min_x);
by = (By - min_y)/(max_y - min_y);

end