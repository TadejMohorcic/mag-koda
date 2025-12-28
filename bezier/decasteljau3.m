function p = decasteljau3(B,u)

n = size(B,1) - 1;

for i = 1:n
    for j = 1:n
        for k = 1:n
            B(j,k) = u(1)*B(j,k) + u(2)*B(j,k+1) + u(3)*B(j+1,k);
        end
    end
end

p = B(1,1);

end