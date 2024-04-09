clear all
clc

C = 1:20;
B = 4;
M = 7;
C_conv47 = code_conv(C,B,M);
C_deconv47 = code_deconv(C_conv47,B,M);

fprintf('信息序列：%s\n',num2str(C));
fprintf('交织结果：%s\n',num2str(C_conv47));
fprintf('去交织结果：%s\n',num2str(C_deconv47));
