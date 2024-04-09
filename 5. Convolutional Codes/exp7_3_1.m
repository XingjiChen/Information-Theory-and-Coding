clear all
clc
G = [1,0,0,1,1;1,1,1,0,1];
M = [1 1 0 0 1 0 1 1];

C = conv_code(M,G);
C_reshape = reshape(C,length(M)+5,2).';

fprintf('输入信息序列：M = %s\n',num2str(M));
fprintf('(2,1,5)卷积编码：C = %s\n',num2str(C_reshape));
