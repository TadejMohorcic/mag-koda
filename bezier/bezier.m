function b = bezier(B, t)
% function b = bezier(B, t) calculates the points on the Bezier curve using
% the De Casteljau algorithm.
% Input:
% - B .. control points of the Bezier curve,
% - t .. time domain.
% Output:
% - b .. points on the Bezier curve.

m = length(t);
[o, n] = size(B);

b = zeros(m, n);

for i = 1:m
    for j = 1:n
        M = decasteljau(B(:, j), t(i));
        b(i, j) = M(1, o);
    end
end

end