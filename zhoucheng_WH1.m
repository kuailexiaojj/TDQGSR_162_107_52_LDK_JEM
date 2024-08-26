clear all;close all;clc
fs=25600;
fsr=5;
Ts=1/fs;
h=1/fsr;%时间步长，二次样频率
t=0:Ts:19999*Ts;
z1=importdata('z.mat');

% a=0.0819;b=0.2035;c=0.0508;d=2.1028;r=2.0328;
% a1=0.0015;b1=0.3738;c1=0.0668;d1=2.4508;m=0.6105;r1=2.3528;%高斯白噪声
a=1.6797;b=2.1919;c=3.710;h1=0.001;cc=0.194628;ee=0.90661;
a5=a.^2;b5=b.^2;c5=c.^2;
%N=4096;
a4=1;b4=1.9;v4=0.5;r4=1;%QGSR
a1=0.4033;b1=2.3518;v=2.17905;r1=0.1094;c1=0.0194628;e=0.090661;
x11=z1(1:20000);
%三值噪声
q=0.1;tao=1/200;taocor=2;tend=10;
a3=0.5;b3=0;c3=-a3;
D1=taocor*(a3^2*q+b3^2*(1-2*q)+c3^2*q-(a3*q+b3*(1-2*q)+c3*q)^2)
t1=0:tao:(length(t)-1)*tao;
noise = trichotomous1(q,tao,taocor,t1,a3,b3,c3);
figure(5)
plot(t1,noise)
D=0.3;
noise1=sqrt(2*D)*randn(size(t));

% %levy
noise2=sqrt(2*0.01)*rasd(length(t),1.6,0,1,0);
 x1=noise2+x11';

y1=hilbert(x1);
yIn1=abs(y1);
y1=yIn1-mean(y1);

x=TDCQSRlgkt(a5,b5,c5,h1,c1,e,h,y1);
xx=TDUPQSRlgkt(a1,b1,v,r1,c1,e,h,y1);
xxx=ODUPQSRlgkt(a4,b4,v4,r4,h,y1);
%% 输入信号
ff=fs*(1:10000)/20000; 

y0=fft(x1,20000); 
py0=y0.*conj(y0)/20000;
po0=py0(1:10000);

%% 输出信号 
y11=fft(x,20000); 
py1=y11.*conj(y11)/20000;
po1=py1(2:10001);

y2=fft(xx,20000); 
py2=y2.*conj(y2)/20000;
po2=py2(2:10001);

y3=fft(xxx,20000); 
py3=y3.*conj(y3)/20000;
po3=py3(2:10001);

figure('name', 'ALL');set(gcf,'color','white');

subplot(2,2,1);plot(ff,po0,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(a)','Fontname', 'Times New Roman','FontSize',12);

subplot(2,2,2);plot(ff,po1,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(b)','Fontname', 'Times New Roman','FontSize',12);
subplot(2,2,3);plot(ff,po3,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(c)','Fontname', 'Times New Roman','FontSize',12);
subplot(2,2,4);plot(ff,po2,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(d)','Fontname', 'Times New Roman','FontSize',12);
ff0=find(ff==107.52);
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)))
SNRout1 =10*log10( po1(ff0)/(sum(po1)-po1(ff0)))
SNRout2 =10*log10( po2(ff0)/(sum(po2)-po2(ff0)))
SNRout3 =10*log10( po3(ff0)/(sum(po3)-po3(ff0)))
SNRG1=SNRout1-SNRin
SNRG2=SNRout2-SNRin
SNRG3=SNRout3-SNRin