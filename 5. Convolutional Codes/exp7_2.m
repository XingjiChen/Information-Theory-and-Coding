clear all
clc

N = 100000;
snrdB = 0:4;
symbol = round(rand(1,N));

G_ham = [1 0 0 0 1 0 1;...
     0 1 0 0 0 1 1;...
     0 0 1 0 1 1 1;...
     0 0 0 1 1 1 0];
[k,n] = size(G_ham);
C_ham = hamming_code(symbol,G_ham);
[groups,~] = size(C_ham);
C_ham1 = reshape(C_ham.',[1,length(C_ham(:))]);

G_conv = [1,0,1;1,1,1];
C_conv = conv_code(symbol,G_conv);

[~,BER_dir] = BPSK(symbol,snrdB);
[RX_ham,~] = BPSK(C_ham1,snrdB);
[RX_conv,~] = BPSK(C_conv,snrdB);

errors_ham = zeros(1,length(snrdB));
for i=1:length(snrdB)
    RX_ham1 = reshape(RX_ham(i,:),[n,groups]).';
    result_ham = hamming_decode(RX_ham1,G_ham);
    errors_ham(i) = sum(sum(mod(result_ham+C_ham(:,1:k),2)));
end
BER_ham = errors_ham/N;


errors_conv = zeros(1,length(snrdB));
for i=1:length(snrdB)
    [result_conv] = conv_decode(G_conv,1,RX_conv(i,:));
    errors_conv(i) = sum(mod(result_conv+symbol,2));
end
BER_conv = errors_conv/N;

figure
semilogy(snrdB,BER_dir,'*-',snrdB,BER_ham,'o-',snrdB,BER_conv,'-x');
grid on;
xlabel('信噪比 SNR / dB');ylabel('误码率 BER');
title('未编码、(7,4)汉明码、(2,1,3)卷积码的误码率曲线');
legend('未编码系统','(7,4)汉明码系统','(2,1,3)卷积码系统');

