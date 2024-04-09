clear all
clc

p = input('请输入信源分布：\n');
N = length(p);

code = strings(N-1,N);
position = zeros(N-1,N);
p_SD = p;

for i=1:N-1
    M = length(p_SD);
    [p_SD,position(i,1:M)] = sort(p_SD,'descend');
    code(i,M) = '1';
    code(i,M-1) = '0';
    p_SD(M-1) = p_SD(M-1)+p_SD(M);
    p_SD(M)=[];
end

CODE = strings(1,N);
for i=1:N
    count = i;
    for m=1:N-1
        [row,count] = find(position(m,:)==count);
        CODE(1,i) = strcat(CODE(1,i),code(m,count));
        if count==N+1-m
            count = count-1;
        end
    end
end
CODE = reverse(CODE);

for i=1:N
    L(i) = size(char(CODE(1,i)),2);
end

L_H = sum(L.*p);      
H = sum(-p.*log2(p));
yita = H/L_H;

disp(['输出码字: ',CODE]);
disp(['信源信息熵: H(X)=',num2str(H),'(bits)']); 
disp(['平均码长: L=',num2str(L_H),'(bits)']);
disp(['编码效率: ',num2str(yita)]);

