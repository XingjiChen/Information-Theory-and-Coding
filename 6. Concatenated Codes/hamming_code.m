function C = hamming_code(M,G)

[k,n] = size(G);
N = size(M,2);
r = k-rem(N,k);
M_add0 = [M,zeros(1,r)];
groups = ceil(length(M_add0)/k);
M_dis = reshape(M_add0,[k,groups]).';
C = mod(M_dis*G,2);

end