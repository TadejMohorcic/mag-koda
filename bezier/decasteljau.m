function D = decasteljau(b, t)
% function d = decasteljau(b, t) performs the De Casteljau algorithm.
% Input:
%  b .. control points of a Bezier curve,
%  t .. time parameter.
% Output:
%  D .. matrix with all intermediate points of the algorithm.

n = length(b);
D = NaN(n);

for i = 1:n
    D(i, 1) = b(i);
end

for k = 2:n
    for j = 1:n-k+1
        D(j, k) = (1 - t)*D(j, k-1) + t*D(j+1, k-1);
    end
end

end