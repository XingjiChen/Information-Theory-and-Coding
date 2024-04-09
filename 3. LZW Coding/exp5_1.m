clear all
clc

str = input('待编码字符：\n','s');
N = length(str);

dic_ini = string({'a','1';'b','2';'c','3'});

P = '';
C = '';
dic = dic_ini;
code = '';

for i=1:N
    len_dic = size(dic,1);
    C = str(i);
    PC = strcat(P,C);
    for m=1:len_dic
        if strcmp(PC, dic(m,1))==1
            P = PC;
            break;
        else if m==len_dic 
                dic(len_dic+1,1) = PC;
                dic(len_dic+1,2) = num2str(len_dic+1);
                for n=1:len_dic
                    if strcmp(P, dic(n,1))==1
                    code = strcat(code,num2str(n));
                    end
                end
                P = str(i);
            end
        end
    end
end

for n=1:len_dic
    if strcmp(P, dic(n,1))==1
    code = strcat(code,num2str(n));
    end
end

fprintf('初始字典:\n');disp(dic_ini);
fprintf('编码后的码字流:\n');disp(code);
fprintf('扩充字典:\n');disp(dic);

