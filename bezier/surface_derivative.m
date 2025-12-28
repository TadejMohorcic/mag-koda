function [bx, by, bz] = surface_derivative(Bx, By, Bz, u, v)
%SURFACE_DERIVATIVE Compute control points of u,v derivative of a surface
%
%   [bx, by, bz] = surface_derivative(Bx, By, Bz, u, v)
%
%   Inputs:
%       Bx, By, Bz : m x n matrices of control point coordinates
%       u, v       : orders of derivative along u- and v-direction
%
%   Outputs:
%       bx, by, bz : (m-u) x (n-v) matrices of derivative control points

    [m, n] = size(Bx);
    bx = zeros(m-u, n-v);
    by = zeros(m-u, n-v);
    bz = zeros(m-u, n-v);

    % Loop over derivative indices
    for i = 1:(m-u)
        for j = 1:(n-v)
            valx = 0; valy = 0; valz = 0;
            for p = 0:u
                for q = 0:v
                    coeff = (-1)^(u-p + v-q) * nchoosek(u,p) * nchoosek(v,q);
                    valx = valx + coeff * Bx(i+p, j+q);
                    valy = valy + coeff * By(i+p, j+q);
                    valz = valz + coeff * Bz(i+p, j+q);
                end
            end
            bx(i,j) = valx;
            by(i,j) = valy;
            bz(i,j) = valz;
        end
    end
end