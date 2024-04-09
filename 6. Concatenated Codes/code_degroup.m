function C_degroup = code_degroup(C_group,m,n)
    
    N = length(C_group);
    C_degroup = zeros(1,N);
    
    for i=1:N/n/m
        Ci = C_group(1,(1:m*n)+m*n*(i-1));
        C_degroupi = reshape(reshape(Ci.',m,n).',1,n*m);
        C_degroup(1,(1:m*n)+m*n*(i-1)) = C_degroupi;
    end

end
