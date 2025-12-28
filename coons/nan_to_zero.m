function M = nan_to_zero(M)

M(isnan(M)) = 0;

end