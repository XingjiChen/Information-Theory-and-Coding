clear all
clc

N = 100000;
snrdB = 0:4;
symbol = round(rand(1,N));

G_conv1 = [1,0,1;1,1,1];
C_conv1 = conv_code(symbol,G_conv1);

G_conv2 = [1,0,1;1,1,1;1,1,1];
C_conv2 = conv_code(symbol,G_conv2);

[~,BER_dir] = BPSK(symbol,snrdB);
[RX_conv1,~] = BPSK(C_conv1,snrdB);
[RX_conv2,~] = BPSK(C_conv2,snrdB);

errors_conv1 = zeros(1,length(snrdB));
for i=1:length(snrdB)
    [result_conv1] = conv_decode(G_conv1,1,RX_conv1(i,:));
    errors_conv1(i) = sum(mod(result_conv1+symbol,2));
end
BER_conv1 = errors_conv1/N;

errors_conv2 = zeros(1,length(snrdB));
for i=1:length(snrdB)
    [result_conv2] = conv_decode(G_conv2,1,RX_conv2(i,:));
    errors_conv2(i) = sum(mod(result_conv2+symbol,2));
end
BER_conv2 = errors_conv2/N;

figure
semilogy(snrdB,BER_dir,'*-',snrdB,BER_conv1,'o-',snrdB,BER_conv2,'-x');
grid on;
xlabel('信噪比 SNR / dB');ylabel('误码率 BER');
title('未编码、(2,1,3)卷积码、(3,1,3)卷积码的误码率曲线');
legend('未编码系统','(2,1,3)卷积码系统','(3,1,3)卷积码系统');

