p=0:0.001:1;
C=1+p.*log2(p)+(1-p).*log2(1-p);
plot(p,C);

xlabel("p");
ylabel("C");
title('BSC 的信道容量公式')