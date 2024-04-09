function C_derand = code_derand(C_rand,s)
    
    len = length(C_rand);
    N = length(s);
    
    C_derand = zeros(1,len);
    C_derandi = zeros(1,N);
    
    for m=1:len/N
        C_dei = C_rand(1,(1:N)+(m-1)*N);
        for i=1:N
            C_derandi(1,i) = C_dei(1,s(i));
        end
        C_derand(1,(1:N)+(m-1)*N) = C_derandi;
    end

end
