%%  蒙特卡罗解决武器升级问题
% 现在有一把神器，初始为1级，可免费领取（即价值为0），可花费金币对其升级，每次10000金币，最多升到5级。
% 给定一个升级的概率表(见讲义)，问：5级神器价值多少金币？（即升级到5级神器平均的花费）

%% （1）预备知识
% 以一定的概率产生随机数  randsrc(m,n,[alphabet; prob])
% m和n表示生成的随机数矩阵的行数和列数
% alphabet表示需要产生的随机数的数字，用一个行向量表示
% prob表示这些数字出现的概率大小，用一个行向量表示，向量长度和alphabet向量要完全相同, 且这些概率的和要为1
% 比如：要产生1、4、 6这三个数。它们分别出现的概率为 0.1、0.2、0.7，如何设计程序使得按照这个概率产生10个随机数呢？
alphabet = [1 4 6]; prob = [0.1 0.2 0.7];
randsrc(10,1,[alphabet; prob])

%% （2）参考答案
clear;clc
tic  %计算tic和toc中间部分的代码的运行时间
% 升级的成功率储存在success矩阵中，以第一行和第三行为例，表格的解释：
%  1级武器强化时，有20%概率升到2级，10%概率升到3级，5%概率升到4级，65%概率不变。
%  3级武器强化时，10%概率跌到1级，20%概率跌到2级，20%概率升到4级，10%概率升到5级
success = [0.65 0.2  0.1  0.05  0;
                 0.25 0.4  0.2  0.1    0.05;
                 0.1   0.2  0.4  0.2    0.1;
                 0      0.1  0.3  0.4    0.2] ;
n = 10000;  % 蒙特卡罗模拟的次数
MONEY = zeros(n,1);  % 初始化用来存储每次蒙特卡罗计算出来的表示强化费用的向量
for i = 1:n
    rank = 1; % 武器的初始等级
    money = 0;  %花费的钱数，初始化为0
    alphabet = [1 2 3 4 5];   % 用来表示五个等级
    while rank ~= 5  % 只要等级不是5级， 就一直循环下去
        prob =success(rank,:);    % 令生成随机数的概率为第rank行
        rank = randsrc(1,1,[alphabet; prob]);   % 生成一个在1-5中的随机数，表示强化后的等级
        money = money + 10000;  % 更新强化的费用
    end
    MONEY(i) = money;  % 将这次蒙特卡罗的结果保存到MONEY向量中
end
disp(['将武器升级到5级的平均花费为：',num2str(mean(MONEY))])
toc  %计算tic和toc中间部分的代码的运行时间




% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个无忧自动发货的短信中有加入方式）的群文件中下载。包括讲义、代码、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）