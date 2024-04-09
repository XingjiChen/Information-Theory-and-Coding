clear all
clc

p=input('请输入信源分布:')
L=length(p);

for i=1:L-1
    for n=i+1:L
        if (p(i)<p(n))
                t=p(i);
                p(i)=p(n);
                p(n)=t;    
        end
    end
end

disp('信源分布概率从大到小为：')
disp(p)

sum_p=0;
n_re=0;
ssum=zeros(L,1);
bit=zeros(L,1);
w_10to2=zeros(L,1);

for m=1:L;
    ssum(m)=sum_p;
    sum_p=sum_p+p(m);
    bit(m)=ceil(-log2(p(m)));
    code=zeros(bit(m),1);
    x=ssum(m);
    n_re=max(bit(m));
    w_10to2=dtob(x,n_re);
    for r=1:bit(m)
        code(r)=w_10to2(r);
    end  
%    disp('输出结果：');
%    disp('初始概率:'),disp(p(m))
%    disp('求和结果:'),disp(ssum(m))
%    disp('编码位数:'),disp(bit(m))
   disp('香农编码:'),disp(code') 
end

H=sum(-p.*log2(p));
L_s=sum(bit'.*p);
yita=H/L_s;
disp(['信源信息熵:H(X)=',num2str(H),'(bits)']); 
disp(['平均码长:L=',num2str(L_s),'(bits)']);
disp(['编码效率:',num2str(yita)]); 


function y=dtob(x,f)
for i=1:f
    temp=x.*2;
    if(temp<1)
        y(i)=0;
        x=temp;
    else
        x=temp-1;
        y(i)=1;
    end
end
end
