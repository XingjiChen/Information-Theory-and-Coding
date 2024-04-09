function [C_rand,s] = code_rand(C,N)

    len_C = length(C);
    num0 = mod(N-mod(len_C,N),N);
    C_add0 = [C,zeros(1,num0)];
   
    s = randperm(N);
    
    len_add0 = length(C_add0);
    C_rand = zeros(1,len_add0);
    Couti = zeros(1,N);
    
    for m=1:len_add0/N
        Ci = C_add0(1,(1:N)+(m-1)*N);
        for i=1:N
            Couti(1,s(i)) = Ci(i);
        end
        C_rand(1,(1:N)+N*(m-1)) = Couti;
    end

end
