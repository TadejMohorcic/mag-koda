function [bx, by, bz] = bezier2(Bx, By, Bz, u, v)
% function [bx, by, bz] = bezier2(Bx, By, Bz, u, v) calculates the points
% on a Bezier surface using 1D bezier curve calculations.
% Input:
%  Bx, By, Bz .. control points of the Bezier surface,
%  u, v .. time domains.
% Output:
%  bx, by, bz .. points on the Bezier surface.

N = length(u);
M = length(v);
n = size(Bx, 2);

bx = zeros(M, N);
by = zeros(M, N);
bz = zeros(M, N);

b = zeros(n, 3);

for i = 1:M
    for j = 1:n
        b(j, :) = bezier([Bx(:, j), By(:, j), Bz(:, j)], v(i));
    end

    for k = 1:N
        bx(i, k) = bezier(b(:, 1), u(k));
        by(i, k) = bezier(b(:, 2), u(k));
        bz(i, k) = bezier(b(:, 3), u(k));
    end

end

end