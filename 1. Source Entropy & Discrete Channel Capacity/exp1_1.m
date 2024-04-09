clear all;

p=0:0.001:1;
hp=-p.*log2(p)-(1-p).*log2(1-p);
plot(hp);
xlabel("一个信源的概率 p");
ylabel("二元信源熵 H(p)");
title('二元信源熵函数曲线')