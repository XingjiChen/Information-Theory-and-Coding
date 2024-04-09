function [code,BER] = BPSK(symbol,SNRdb)

N = length(symbol);
snr = 10.^(SNRdb/10);
len_snr = length(snr);

code = zeros(len_snr,N);
errors = zeros(1,len_snr);
for j=1:len_snr
   sigma = sqrt(1/(2*snr(j)));
   error_count = 0;
   for i=1:N
      x_d = 2*symbol(i) - 1;
      n_d = sigma*randn(1);
      y_d = x_d + n_d;
      if y_d > 0
         code(j,i) = 1;
      else
         code(j,i) = 0;
      end
      if (code(j,i) ~= symbol(i))
         error_count = error_count + 1;
      end
   end
   errors(j) = error_count;
end
BER = errors/N;
end
