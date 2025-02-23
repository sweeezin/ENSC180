function Pk = bino_pk(n, p)
    q = 1 - p;
    Pk = zeros(1, n+1);
    for k = 0:n
        Pk(k+1) = nchoosek(n, k) * (p^k) * (q^(n-k));
    end
end