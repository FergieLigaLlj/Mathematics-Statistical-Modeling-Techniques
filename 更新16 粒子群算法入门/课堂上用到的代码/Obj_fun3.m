function y = Obj_fun3(x)
% ע�⣬x��һ������
% Sphere����
%     y = sum(x.^2);  % x.^2 ��ʾx��ÿһ��Ԫ�طֱ����ƽ��

% Rosenbrock����
    tem1 = x(1:end-1);  
    tem2 = x(2:end);
    y = sum(100 * (tem2-tem1.^2).^2 + (tem1-1).^2);

% Rastrigin����
%     y = sum(x.^2-10*cos(2*pi*x)+10);

% Griewank����
%     y = 1/4000*sum(x.*x)-prod(cos(x./sqrt(1:30)))+1;
end