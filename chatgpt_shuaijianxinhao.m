A = 1;          % 振幅
f = 1;          % 频率（周期）
alpha = 0.1;    % 衰减系数
T = 2;          % 信号总时间
fs = 1000;      % 采样频率
num_periods = 5; % 生成的周期数

% 生成时间向量
t = 0:1/fs:T;

% 生成周期指数型衰减正弦信号
x = zeros(1, numel(t));
period_length = numel(t) / num_periods;

% 模拟故障：在第三个周期内引入衰减
fault_period = 3;

for i = 1:num_periods
    period_start = (i - 1) * period_length + 1;
    period_end = i * period_length;
    
    if i == fault_period
        % 在故障周期内引入额外的衰减
        x(period_start:period_end) = A * exp(-alpha * t(period_start:period_end)) .* sin(2 * pi * f * t(period_start:period_end)) * 0.5;
    else
        x(period_start:period_end) = A * exp(-alpha * t(period_start:period_end)) .* sin(2 * pi * f * t(period_start:period_end));
    end
end

% 绘制信号
plot(t, x);
title('模拟故障信号的周期指数型衰减正弦信号');
xlabel('时间');
ylabel('幅度');
grid on;