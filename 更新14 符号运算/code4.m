%% matlab��ⷽ�̺ͷ�����
% ��ͬ��MATLAB�汾֮����﷨���ڲ����ݵ������https://www.zhihu.com/question/360875116/answer/937256480
% ��Ƶ�����õ�����Matlab2017a�汾������Ͱ汾�汾���ܻᱨ��
% �������Matlab�󷽳̵Ľ��ܿɿ�������ͣ�https://blog.csdn.net/weixin_30724853/article/details/99004382

%% solve����
%% ����1: ��ⵥ��������
clear;clc
syms x
answ = solve(sin(x) == 1, x)  % ע�⣺����ĵȺ�һ��Ҫ��������һ���Ⱥű�ʾ��ֵ�������ȺŲű�ʾ�����������
answ = solve(sin(x) == 1)  % ֻ��һ�����ű���x�����Կ��Բ�ָ��δ֪��
% Ҳ��������д
clear;clc
syms x
eqn = (sin(x) == 1);  % eqn = sin(x) == 1;  
answ = solve(eqn, x)
% ��Ϊ���Ǻ��������ں��������Ҫ�õ����еĽ⣬����Ҫ��������
[answ, params, condions] = solve(eqn, x, 'ReturnConditions', true)

%% ����2: ������������
clear;clc
syms a b c x
eqn = (a*x^2 + b*x + c == 0);
answ1 = solve(eqn, x)  % ��x��Ϊδ֪����� 
%  -(b + (b^2 - 4*a*c)^(1/2))/(2*a)
%  -(b - (b^2 - 4*a*c)^(1/2))/(2*a)
answ2 = solve(eqn, a) % ��a��Ϊδ֪�����
% -(c + b*x)/x^2

%% ����3�����������
clear;clc
syms u v a
eqn = [2*u + v == a, u - v == 1];
answ = solve(eqn, [u, v])
answ.u
answ.v
[answ_u, answ_v] = solve(eqn, [u, v])


%% solve ���ܻᾯ��
syms x
eqn = (sin(x) == x^2 - 1);
solve(eqn, x)  % ����: Cannot solve symbolically. Returning a numeric approximation instead. 
% ��ͼ���� 
fplot(sin(x), [-2 2])  % fplot�����ɻ��Ʊ��ʽ��ͼ��
hold on
fplot(x^2 - 1, [-2 2]) 


%% vpasolve�������
% ��vpasolve����ָ����[0 2]�ϵĽ�
syms x
eqn = sin(x) == x^2 - 1;
vpasolve(eqn, x, [0 2])
vpasolve(eqn, x, [-1 0])
vpasolve(eqn, x, [-10 10])
% vpasolve returns all solutions only for polynomial equations. 
% For nonpolynomial equations, there is no general method of finding all solutions.
% When you look for numerical solutions of a nonpolynomial equation or system that has several solutions,
% then, by default, vpasolve returns only one solution, if any. 
% To find more than just one solution, set random to true. 
% Now, calling vpasolve repeatedly might return several different solutions.
vpasolve(eqn, x, 'random', true) 
vpasolve(eqn, x, -5)   % ������������ʼ��


%% ����һ�������ӵ�����
syms x y
eqn = [x^2 - 2*x - 3*x*y == 10, y^4 == exp(-2*x/3*y)]
[answ_x, answ_y] = vpasolve(eqn, [x, y], 'random', true)
% ��ͼ����
ezplot(x^2 - 2*x - 3*x*y == 10, [-10 10])
hold on
ezplot(y^4 == exp(-2*x/3*y), [-10 10])
close % �ر�ͼ��

% ezplot�����Ƚϼ��ߣ�������������Ƚ�����Ŷ
fimplicit(x^2 - 2*x - 3*x*y == 10, [-10 10],'r')  % R2016b�汾֮�����
hold on
fimplicit(y^4 == exp(-2*x/3*y), [-10 10],'b')  % R2016b�汾֮�����
[answ_x, answ_y] = vpasolve(eqn, [x, y],[-4 -1;1 5])  % ָ�������ķ�Χ��xλ��[-4 -1], yλ��[1 5]
hold on
plot(answ_x, answ_y,'ko', 'MarkerSize',10)   
% plot(double(answ_x), double(answ_y),'ko', 'MarkerSize',10)   % double���Խ����ǵķ��ű���ת��Ϊ��ֵ����


%% fsolve��������⹦����Ϊǿ��Ŷ��
% fsolve��Matlab�Ż��������е�һ����������ר����������ر��ӵķ��̺ͷ�����
x0 = [0,0];  % ��ʼֵ
result_x = fsolve(@my_fun,x0)

% ��Ȼ��Ҳ������vpasolve��������
clear; clc
syms x1 x2
eqn =  [exp(-exp(-(x1+x2))) - x2*(1+x1^2) == 0, x1*cos(x2) + x2*sin(x1) - 0.5 == 0]
[answ_x1, answ_x2] = vpasolve(eqn, [x1, x2], [0 0])


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ������
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ
% % ��Ƶ���ᵽ�ĸ��������ۺ�Ⱥ��������յ����Ǹ������Զ������Ķ������м��뷽ʽ����Ⱥ�ļ������ء��������塢���롢����Ƶ���Ƽ������ϵȡ�
% % ��ע�ҵ�΢�Ź��ںš���ѧ��ģѧϰ����������̨���͡�����������֣��ɻ�ó����Ľ�ģ������ط��������͡����ݡ������֣��ɻ�ý�ģ���ݵĻ�ȡ���������͡���ͼ�������֣��ɻ����ѧ��ģ�г����Ļ�ͼ���������⣬Ҳ���Կ������ںŵ���ʷ���£����淢���Ķ��ǶԴ���а����ļ��ɡ�
% % ����������ʾ�ѡ����ѧ��ģ���ϣ��ɹ�ע�ҵ�΢�Ź��ںš���ѧ��ģѧϰ���������ں�̨���͡�������ּ��ɽ������(�ҵ�΢���ַ��https://weidian.com/?userid=1372657210)���й���
% % ��Ƶ�۸񲻹󣬵���ֵ�ܸߡ����˹���ۿ�ֻ��Ҫ58Ԫ�����˹����˾�����46Ԫ����Ƶ����Ҳ�����ص����عۿ��ģ��������Ҳ�Ҫ�ַ�֪ʶ��Ȩ������Ƶ�������Ͻ��ж������ۡ�
% % ����޸Ĵ��������صķ�����https://www.bilibili.com/video/av59423231���ؿ���