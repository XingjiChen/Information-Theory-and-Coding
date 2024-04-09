function C_conv47 = code_conv(C,B,M)
    
    N = length(C);
    num0 = mod(B-mod(N,B),B);
    C_add0 = [C,zeros(1,num0)];

    N_add0 = length(C_add0);
    C_conv47 = zeros(1,N_add0+B*(B-1)*M);
    
    for i=1:N_add0
        RE = mod(i-1,B);
        C_conv47(1,i+RE*B*M) = C_add0(1,i);
    end    
    
end
