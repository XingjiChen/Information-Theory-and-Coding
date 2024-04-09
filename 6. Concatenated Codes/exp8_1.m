clc
clear all

C = 1:20;
m = 7;
n = 4;
C_group = code_group(C,m,n);
C_degroup = code_degroup(C_group,m,n);

fprintf('信息序列：%s\n',num2str(C));
fprintf('交织结果：%s\n',num2str(C_group));
fprintf('去交织结果：%s\n',num2str(C_degroup));
