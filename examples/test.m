Bx = [2 4 6 8 10 12 12; 0.5 0 0 0 0 9 NaN; 0 0 0 0 7 NaN NaN; 1 0 0 6 NaN NaN NaN; 1 0 4 NaN  NaN NaN NaN; 0.5 3 NaN NaN NaN NaN NaN; 0 NaN NaN NaN NaN NaN NaN];
By = [-0.5 0 1 2 4 6 8; 1 0 0 0 0 6 NaN; 3 0 0 0 5 NaN NaN; 4 0 0 5 NaN NaN NaN; 5 0 5.5 NaN  NaN NaN NaN; 6 6 NaN NaN NaN NaN NaN; 7 NaN NaN NaN NaN NaN NaN];

n = size(Bx,1) - 1;

[bx, by] = coons_tri_patch(Bx, By);

BX = bx';
BX = BX(:);
BX = BX(~isnan(BX));

BY = by';
BY = BY(:);
BY = BY(~isnan(BY));

[TRI, U] = trimeshgrid(24);

b = bezier3(bx, by, zeros(size(bx)), U);

tri = triangulation(TRI, b);

figure
trisurf(tri, 'FaceColor', 'None', 'EdgeColor', '#FFAA5E');
hold on
trimesh(trimeshgrid(n+1), BX, BY, zeros(size(BX)), 'EdgeColor', 'black', 'FaceColor', 'none');
hold on
scatter3(BX, BY, zeros(size(BX)), 'filled', 'MarkerFaceColor', '#AA8F78', 'MarkerEdgeColor', 'Black');
hold on


grid off
set(gca,'visible','off')

view([-0.50 90.00])