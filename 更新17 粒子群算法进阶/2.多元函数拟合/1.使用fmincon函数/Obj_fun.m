function f = Obj_fun(k)
    global x y;  % ���Ӻ�����ʹ��ȫ�ֱ���ǰҲ��Ҫ������
    y_hat = exp(-k(1)*x(:,1)) .* sin(k(2)*x(:,2)) + x(:,3).^2;  % ���ֵ
    f = sum((y - y_hat) .^ 2);
end