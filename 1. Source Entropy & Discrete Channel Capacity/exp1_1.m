clear all;

p=0:0.001:1;
hp=-p.*log2(p)-(1-p).*log2(1-p);
plot(hp);
xlabel("һ����Դ�ĸ��� p");
ylabel("��Ԫ��Դ�� H(p)");
title('��Ԫ��Դ�غ�������')