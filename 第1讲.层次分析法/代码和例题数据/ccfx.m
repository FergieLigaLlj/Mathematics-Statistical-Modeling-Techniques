disp('�������жϾ���A')
A=input('A=');
[n,n] = size(A);
%%����ֵ����Ȩ��
[V,D] = eig(A);
Max_eig = max(max(D));
[r,c]=find(D == Max_eig , 1);
disp('����ֵ����Ȩ�صĽ��Ϊ��');
disp( V(:,c) ./ sum(V(:,c)) )
%%һ���Ա���CR
CI = (Max_eig - n) / (n-1);
RI=[0 0.0001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59]; 
CR=CI/RI(n);
disp('һ����ָ��CI=');disp(CI);
disp('һ���Ա���CR=');disp(CR);
if CR<0.10
    disp('��ΪCR<0.10�����Ը��жϾ���A��һ���Կ��Խ���!');
else
    disp('ע�⣺CR >= 0.10����˸��жϾ���A��Ҫ�����޸�!');
end
