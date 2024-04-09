function C_deconv47 = code_deconv(C_conv47,B,M)
   
    N = length(C_conv47);
    C_deconv47 = zeros(1,N+B*(B-1)*M);
    
    for i=1:N
        RE = mod(B-mod(i,B),B);
        C_deconv47(1,i+RE*B*M) = C_conv47(1,i);
    end    

    C_deconv47(end-B*(B-1)*M+1:end) = [];
    C_deconv47(1:B*(B-1)*M) = [];

end
