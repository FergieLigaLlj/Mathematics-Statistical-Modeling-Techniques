% Ŀ�꺯���ο�������ֵ��38.8503    
narvs = 2; % ��������
x_lb = [-3 4.1]; % x���½�
x_ub = [12.1 5.8]; % x���Ͻ�

%% ֱ��ʹ��particleswarm����
[x,fval] = particleswarm(@Obj_fun_1,narvs,x_lb,x_ub)
fval = -fval

%% ������Ⱥ�㷨�õ��Ľ���Ϊ��ʼֵ����������fmincon�������
options = optimoptions('particleswarm','HybridFcn',@fmincon);
[x,fval] = particleswarm(@Obj_fun_1,narvs,x_lb,x_ub,options)
fval = -fval

%% �޸Ĳ���������Ҫ�������Ӹ�������Ϊ�����ֲ���Сֵ̫����
options = optimoptions('particleswarm','FunctionTolerance',1e-12,'MaxStallIterations',100,'MaxIterations',20000,'SwarmSize',1000);
[x,fval] = particleswarm(@Obj_fun_1,narvs,x_lb,x_ub,options)
fval = -fval