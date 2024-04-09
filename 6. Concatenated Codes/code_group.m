function C_group = code_group(C,m,n)
    
    N = length(C);
    num0 = mod(m*n-mod(N,m*n),m*n);
    C_add0 = [C,zeros(1,num0)];
    N_add0 = length(C_add0);
    C_group = zeros(1,N_add0);
    
    for i=1:length(C_add0)/n/m
        Ci = C_add0(1,(1:m*n)+m*n*(i-1));
        Couti = reshape(reshape(Ci.',n,m).',1,m*n);
        C_group(1,(1:m*n)+m*n*(i-1)) = Couti;
    end
    
end
