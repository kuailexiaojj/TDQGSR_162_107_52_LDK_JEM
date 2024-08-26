clear all;clc
% 定义参数
Fs = 5; % 采样频率
T = 10000; % 信号时长（秒）
Ts=1/Fs;
h=1/Fs;
t = 0:Ts:(T-1)*Ts;
f_signal = 1; % 信号频率
A=0.1;
a1=0.5;b1=1.2;v=0.45;r=1;c=1.5;e=0.005;
% 初始化变量
noise_powers = 0:0.01:2; % 不同噪声强度的范围
gain_factors = zeros(size(noise_powers)); % 存储功率谱增益因子

% 计算功率谱增益因子
for i = 1:length(noise_powers)
    noise_power = noise_powers(i);
    t = 0:1/Fs:T-1/Fs;
    s=A*cos(2*pi*f_signal.*t);
    input_signal = s+sqrt(2*noise_powers(i))*randn(1,length(s));
    noisy_signal = TDUPQSRlgkt(a1,b1,v,r,c,e,h,input_signal);
    
    
    input_spectrum = abs(fft(input_signal)).^2 / (Fs * T);
    output_spectrum = abs(fft(noisy_signal)).^2 / (Fs * T);
    
    signal_frequency_index = round(f_signal * T) + 1;
    
    input_power = input_spectrum(signal_frequency_index);
    output_power = output_spectrum(signal_frequency_index);
    
    gain_factors(i) = output_power / input_power;
end

% 画出关系图
p=polyfit(noise_powers,gain_factors,10);
xx=linspace(0.01,2,100);
yy=polyval(p,xx);
plot(xx, yy, 'b.-', 'LineWidth', 2);
hold on
c=0;e=0;
for i = 1:length(noise_powers)
    noise_power = noise_powers(i);
    t = 0:1/Fs:T-1/Fs;
    s=A*cos(2*pi*f_signal.*t);
    input_signal = s+sqrt(2*noise_powers(i))*randn(1,length(s));
    noisy_signal = TDUPQSRlgkt(a1,b1,v,r,c,e,h,input_signal);
    
    
    input_spectrum = abs(fft(input_signal)).^2 / (Fs * T);
    output_spectrum = abs(fft(noisy_signal)).^2 / (Fs * T);
    
    signal_frequency_index = round(f_signal * T) + 1;
    
    input_power = input_spectrum(signal_frequency_index);
    output_power = output_spectrum(signal_frequency_index);
    
    gain_factors(i) = output_power / input_power;
end

% 画出关系图
p=polyfit(noise_powers,gain_factors,10);
xx=linspace(0.01,2,100);
yy=polyval(p,xx);

plot(xx, yy, 'c.-', 'LineWidth', 2);
xlabel('噪声强度');
ylabel('功率谱增益因子');
title('功率谱增益因子与噪声强度的关系');
grid on;