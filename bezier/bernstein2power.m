function p = bernstein2power(b)
% Opis:
%  bernstein2power pretvori polinom, predstavljen s koeficienti v
%  Bernsteinovi bazi, v polinom, predstavljen v potenčni bazi
%
% Definicija:
%  p = bernstein2power(b)
%
% Vhodni podatek:
%  b    seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
%       polinoma stopnje n v Bernsteinovi bazi od 0-tega do n-tega
%       Bernsteinovega baznega polinoma
% Izhodni podatek:
%  p    seznam koeficientov dolžine n+1, ki po vrsti pripadajo razvoju
%       polinoma stopnje n v potenčni bazi od x^n do 1

n = length(b);
M = zeros(n);
p = zeros(1,n);

for i = 1:n
    for j = i:n
        M(i,j) = (-1)^(i+j)*nchoosek(n-1,j-1)*nchoosek(j-1,i-1);
    end
end

q = M' * b';

for k = 1:n
    p(k) = q(n-k+1);
end

end