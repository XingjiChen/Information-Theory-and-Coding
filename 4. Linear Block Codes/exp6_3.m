clear all
clc

N = 100000;
snrdB = 0:5;
symbol = round(rand(1,N));
G = [1 0 0 0 1 0 1;...
     0 1 0 0 0 1 1;...
     0 0 1 0 1 1 1;...
     0 0 0 1 1 1 0];
[k,n] = size(G);
C = hamming_code(symbol,G);
C1 = reshape(C.',[1,length(C(:))]);

[~,BER_th] = BPSK(symbol,snrdB);

[C_r,~] = BPSK(C1,snrdB);
[groups,~] = size(C);
errors_ham = zeros(1,length(snrdB));
for i=1:length(snrdB)
    C_r1 = reshape(C_r(i,:),[n,groups]).';
    C_result1 = hamming_decode(C_r1,G);
    errors_ham(i) = sum(sum(mod(C_result1+C(:,1:k),2)));
end
BER_ham = errors_ham/N;

figure
semilogy(snrdB,BER_th,'*-',snrdB,BER_ham,'o-');
grid on;
xlabel('信噪比 SNR / dB');
ylabel('误码率 BER');
title('未编码系统与（7,4）汉明编码系统的误码率曲线');
legend('未编码系统','汉明编码系统');


