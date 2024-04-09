function C = conv_encode(m,G)

len = length(m);
[k,n] = size(G);
C = zeros(1,k*len);
m_add0 = [zeros(1,n-1),m,zeros(1,n+1)];

C_code = fliplr(m_add0(1,1:n));
for i =1:len+n
    C(k*i-(k-1):k*i) =  mod(C_code*G.',2);
    C_code = [m_add0(i+n),C_code];
    C_code(end) = [];
end

end