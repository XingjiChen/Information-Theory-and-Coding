clear all
clc

str=input('编码字符：\n','s');

dic=string({'0','0'});
N=length(str);
P='';
C='';
code='';

for i=1:N
    len_dic=size(dic,1);
    C=str(i);
    PC=strcat(P,C);
    num=0;
    for j=1:len_dic
       if strcmp(C,dic(j,1))==1
           num=1;
       end
    end
    if num==0
       dic(len_dic+1,1)=C;
       dic(len_dic+1,2)=num2str(len_dic);
       len_dic=len_dic+1;
    end
    for n=1:len_dic
        if strcmp(PC,dic(n,1))==1
            P=PC;
            break;
        else if n==len_dic
                dic(len_dic+1,1)=PC;
                dic(len_dic+1,2)=num2str(len_dic);
                for k=1:len_dic
                    if strcmp(P,dic(k,1))==1
                        code=strcat(code,num2str(k-1));
                    end
                end
                P=C;
            end
        end
    end
end

for m=1:len_dic
    if strcmp(P,dic(m,1))==1
        code=strcat(code,num2str(m-1));
    end
end

fprintf('编码后的码字流：\n');disp(code);
fprintf('扩充字典：\n');disp(dic(2:end,:));
