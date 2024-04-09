clc
clear all

N = 100000;
snrdB = 0:4;
symbol = round(rand(1,N));

G_ham = [1 0 0 0 1 0 1;...
         0 1 0 0 0 1 1;...
         0 0 1 0 1 1 1;...
         0 0 0 1 1 1 0];
     
[k1,n1] = size(G_ham);
C_ham = hamming_code(symbol,G_ham);
[groups1,~] = size(C_ham);
A = reshape(C_ham.',[1,length(C_ham(:))]);

m = 7;
n = 4;
B1 = code_group(A,m,n);

B = 4;
M = 7;
B2 = code_conv(A,B,M);

N_L = 28;
[B3,s] = code_rand(A,N_L);

G_conv = [1,0,1;1,1,1];
C1 = conv_code(B1,G_conv);
C2 = conv_code(B2,G_conv);
C3 = conv_code(B3,G_conv);

[D1,~] = BPSK(C1,snrdB);
[D2,~] = BPSK(C2,snrdB);
[D3,~] = BPSK(C3,snrdB);

errors1 = zeros(1,length(snrdB));
for i=1:length(snrdB)
    
    E1 = conv_decode(G_conv,1,D1(i,:));
    F1 = code_degroup(E1,m,n);

    len_F1 = length(F1);
    num0 = mod(n1-mod(len_F1,n1),n1);
    F1 = [F1,zeros(1,num0)];
    F1_re = reshape(F1,n1,length(F1)/n1).';  
    sym_re1 = hamming_decode(F1_re,G_ham);
    sym_recover1 = reshape(sym_re1.',length(sym_re1(:)),1).';
    
    len_sym = length(symbol);
    errors1(i) = sum(mod(sym_recover1(1:len_sym)+symbol,2));
end
BER1 = errors1/N;

errors2 = zeros(1,length(snrdB));
for i=1:length(snrdB)

    E2 = conv_decode(G_conv,1,D2(i,:));
    F2 = code_deconv(E2,B,M);

    len_F2 = length(F2);
    num0 = mod(n1-mod(len_F2,n1),n1);
    F2 = [F2,zeros(1,num0)];
    F2_re = reshape(F2,n1,length(F2)/n1).';
    sym_re2 = hamming_decode(F2_re,G_ham);
    sym_recover2 = reshape(sym_re2.',length(sym_re2(:)),1).';
    
    len_sym = length(symbol);
    errors2(i) = sum(mod(sym_recover2(1:len_sym)+symbol,2));
end
BER2 = errors2/N;

errors3 = zeros(1,length(snrdB));
for i=1:length(snrdB)

    E3 = conv_decode(G_conv,1,D3(i,:));
    F3 = code_derand(E3,s);

    len_F3 = length(F3);
    num0 = mod(n1-mod(len_F3,n1),n1);
    F3 = [F3,zeros(1,num0)];
    F3_re = reshape(F3,n1,length(F3)/n1).';
    sym_re3 = hamming_decode(F3_re,G_ham);
    sym_recover3 = reshape(sym_re3.',length(sym_re3(:)),1).';

    len_sym = length(symbol);
    errors3(i) = sum(mod(sym_recover3(1:len_sym)+symbol,2));
end
BER3 = errors3/N;

figure
semilogy(snrdB,BER1,'*-',snrdB,BER2,'o-',snrdB,BER3,'-x');
grid on;
xlabel('信噪比 SNR / dB');
ylabel('误码率 BER');
title('误码率曲线');
legend('（7，4）分组交织','（4，7）卷积交织','长度N=28的随机交织');
