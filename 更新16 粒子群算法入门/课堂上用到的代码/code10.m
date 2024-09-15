%% Matlab�Դ�������Ⱥ���� particleswarm
% particleswarm����������Сֵ��
% ���Ŀ�꺯���������ֵ����Ҫ��Ӹ��ŴӶ�ת��Ϊ����Сֵ��
clear;clc
%  Matlab������Ⱥ�㷨�����Ĳο�����
%       Mezura-Montes, E., and C. A. Coello Coello. "Constraint-handling in nature-inspired numerical optimization: Past, present and future." Swarm and Evolutionary Computation. 2011, pp. 173�C194.
%       Pedersen, M. E. "Good Parameters for Particle Swarm Optimization." Luxembourg: Hvass Laboratories, 2010.
%       Iadevaia, S., Lu, Y., Morales, F. C., Mills, G. B. & Ram, P. T. Identification of optimal drug combinations targeting cellular networks: integrating phospho-proteomics and computational network analysis. Cancer Res. 70, 6704-6714 (2010).
%       Liu, Mingshou , D. Shin , and H. I. Kang . "Parameter estimation in dynamic biochemical systems based on adaptive Particle Swarm Optimization." Information, Communications and Signal Processing, 2009. ICICS 2009. 7th International Conference on IEEE Press, 2010.

%% ��⺯��y = x1^2+x2^2-x1*x2-10*x1-4*x2+60��[-15,15]�ڵ���Сֵ����СֵΪ8��
narvs = 2; % ��������
x_lb = [-15 -15]; % x���½�(���ȵ��ڱ����ĸ�����ÿ��������Ӧһ���½�Լ��)
x_ub = [15 15]; % x���Ͻ�
[x,fval,exitflag,output] = particleswarm(@Obj_fun2, narvs, x_lb, x_ub)   

%% ֱ�ӵ���particleswarm�������������Ժ���
narvs = 30; % ��������
% Sphere����
% x_lb = -100*ones(1,30); % x���½�
% x_ub = 100*ones(1,30); % x���Ͻ�
% Rosenbrock����
x_lb = -30*ones(1,30); % x���½�
x_ub = 30*ones(1,30); % x���Ͻ�
% Rastrigin����
% x_lb = -5.12*ones(1,30); % x���½�
% x_ub = 5.12*ones(1,30); % x���Ͻ�
% Griewank����
% x_lb = -600*ones(1,30); % x���½�
% x_ub = 600*ones(1,30); % x���Ͻ�
[x,fval,exitflag,output] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub)  


%% ������ѵĺ���ֵ����������ı仯ͼ
options = optimoptions('particleswarm','PlotFcn','pswplotbestf') %%first: ����Ⱥ�㷨��//second��plot function��//third��psw plot best f//  
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% չʾ�����ĵ�������
options = optimoptions('particleswarm','Display','iter');
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% �޸�����������Ĭ�ϵ��ǣ�min(100,10*nvars)
options = optimoptions('particleswarm','SwarmSize',50);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% ������Ⱥ�㷨������������������������л����⣨hybrid  n.�����ϳ���; adj.��ϵ�; ���ֵ�;�� 
options = optimoptions('particleswarm','HybridFcn',@fmincon);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% ����Ȩ�صı仯��Χ��Ĭ�ϵ���0.1-1.1
options = optimoptions('particleswarm','InertiaRange',[0.2 1.2]);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% ����ѧϰ���ӣ�Ĭ�ϵ���1.49��ѹ�����ӣ�
options = optimoptions('particleswarm','SelfAdjustmentWeight',2);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% ���ѧϰ���ӣ�Ĭ�ϵ���1.49��ѹ�����ӣ�
options = optimoptions('particleswarm','SocialAdjustmentWeight',2);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% ���ĵ���������Ĭ�ϵ���200*nvars
options = optimoptions('particleswarm','MaxIterations',10000);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% ���������ӵı��� MinNeighborsFraction��Ĭ����0.25 
options = optimoptions('particleswarm','MinNeighborsFraction',0.2);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% �������̶�FunctionTolerance, Ĭ��1e-6, ���ڿ����Զ��˳������Ĳ���
options = optimoptions('particleswarm','FunctionTolerance',1e-8);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% ���ͣ�͵�����MaxStallIterations, Ĭ��20, ���ڿ����Զ��˳������Ĳ���
options = optimoptions('particleswarm','MaxStallIterations',50);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)

%% �����Ǽ���ʱ�䣬ͬʱ�޸��������Ƶ����˳��Ĳ���
tic
options = optimoptions('particleswarm','FunctionTolerance',1e-12,'MaxStallIterations',100,'MaxIterations',100000);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)
toc

%% ������Ⱥ��������������������л�����
tic
options = optimoptions('particleswarm','FunctionTolerance',1e-12,'MaxStallIterations',50,'MaxIterations',20000,'HybridFcn',@fmincon);
[x,fval] = particleswarm(@Obj_fun3,narvs,x_lb,x_ub,options)
toc


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ������
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ
% % ��Ƶ���ᵽ�ĸ��������ۺ�Ⱥ��������յ����Ǹ������Զ������Ķ������м��뷽ʽ����Ⱥ�ļ������ء��������塢���롢����Ƶ���Ƽ������ϵȡ�
% % ��ע�ҵ�΢�Ź��ںš���ѧ��ģѧϰ����������̨���͡�����������֣��ɻ�ó����Ľ�ģ������ط��������͡����ݡ������֣��ɻ�ý�ģ���ݵĻ�ȡ���������͡���ͼ�������֣��ɻ����ѧ��ģ�г����Ļ�ͼ���������⣬Ҳ���Կ������ںŵ���ʷ���£����淢���Ķ��ǶԴ���а����ļ��ɡ�
% % ����������ʾ�ѡ����ѧ��ģ���ϣ��ɹ�ע�ҵ�΢�Ź��ںš���ѧ��ģѧϰ���������ں�̨���͡�������ּ��ɽ������(�ҵ�΢���ַ��https://weidian.com/?userid=1372657210)���й���
% % ��Ƶ�۸񲻹󣬵���ֵ�ܸߡ����˹���ۿ�ֻ��Ҫ58Ԫ�����˹����˾�����46Ԫ����Ƶ����Ҳ�����ص����عۿ��ģ��������Ҳ�Ҫ�ַ�֪ʶ��Ȩ������Ƶ�������Ͻ��ж������ۡ�
% % ����޸Ĵ��������صķ�����https://www.bilibili.com/video/av59423231���ؿ���