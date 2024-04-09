clc
clear all

C = 1:20;
N = 28;
[C_rand,s] = code_rand(C,N);
C_derand = code_derand(C_rand,s);

fprintf('信息序列：%s\n',num2str(C));
fprintf('映射关系：%s\n',num2str(s));
fprintf('交织结果：%s\n',num2str(C_rand));
fprintf('去交织结果：%s\n',num2str(C_derand));
