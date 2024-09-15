disp('请输入判断矩阵A')
A=input('A=');
[n,n] = size(A);
%%特征值法求权重
[V,D] = eig(A);
Max_eig = max(max(D));
[r,c]=find(D == Max_eig , 1);
disp('特征值法求权重的结果为：');
disp( V(:,c) ./ sum(V(:,c)) )
%%一致性比例CR
CI = (Max_eig - n) / (n-1);
RI=[0 0.0001 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59]; 
CR=CI/RI(n);
disp('一致性指标CI=');disp(CI);
disp('一致性比例CR=');disp(CR);
if CR<0.10
    disp('因为CR<0.10，所以该判断矩阵A的一致性可以接受!');
else
    disp('注意：CR >= 0.10，因此该判断矩阵A需要进行修改!');
end
