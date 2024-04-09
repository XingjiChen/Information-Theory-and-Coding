clear all
clc

%[0.21 0.10 0.30 0.09 0.25 0.05]

p=input('请输入信源分布:')
L=length(p);
symbols=(1:L);

[dict,avglen]=huffmandict(symbols,p)

H=sum(-p.*log2(p));
yita=H/avglen;

disp(['信源信息熵:H(X)=',num2str(H),'(bits)']); 
disp(['平均码长:L=',num2str(avglen),'(bits)']);
disp(['编码效率:',num2str(yita)]); 