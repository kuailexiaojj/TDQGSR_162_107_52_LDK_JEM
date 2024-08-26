function SAout = SA_num(x,x1,NN,ff0)
%频谱放大增益（Spectral Amplification，SA）
%ff0为检查频率所在频率坐标f的点数位置

y=fft(x,NN);%输入信号x的频谱
py=y.*conj(y)/NN;%计算输入信号的功率谱
Pin=py(ff0);

y1=fft(x1,NN);%通过SR输出信号x1的频谱
py1=y1.*conj(y1)/NN;%计算输出信号的功率谱
Pout=py1(ff0);%频率f0处的功率

SAout=Pout/Pin;%对SA取对数单位为dB
end





