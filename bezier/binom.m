function c = binom(n, k)

if k < 0 || k > n
    c = 0;
else
    c = nchoosek(n, k);
end

end