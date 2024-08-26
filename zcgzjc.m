clear all;close all;clc
fs=12000;
fsr=5;
% fs=20000;%路斯亮
 %fs=25600;%xijiao
% N=10000;
Ts=1/fs;
h=1/fsr;%时间步长，二次样频率
t=0:Ts:9999*Ts;
% a1=0.3790;b1=0.11;c1=0.15;k=0.2;

% % % % % % % % % % % % % %漫 a1=1.12;b1=0.11;c1=1.445;k=0.2;
% % % % % % % % % % % % % % v=sqrt((b1+sqrt(b1.^2-4*a1*c1))/(2*c1));

% % a1=1.2;b1=1;v=0.1;R=3;

% % a1=0.5;b1=1;v=0.1;R=3;
% k=2.5;
a1=0.3033;b1=1.5518;v=2.17905;r=0.2094;c1=0.194628;e=0.90661;
% a1=0.5;b1=2;v=0.9413;r=0.467;c1=1.5;e=0.005;%TDQGSR
%a1=1;b1=0.01;v=0.01;r=2.01;c1=0.01;e=0.005;%TDQGSR
a2=0.4033;b2=0.4;v2=0.87905;r2=1.6094;%TDTGSR
a4=0.5;b4=0.9;v4=0.3;r4=1;%QGSR
a=1.0797;b=2.1919;c=3.210;h1=0.01;
a3=a.^2;b3=b.^2;c3=c.^2;
%N=4096;
 N=10000;
% a=1;b=1;
% h1=0.0437;p=0.5162;m=2.2382;w=1.8319;r=1.4202;%外圈
% h1=0.0594;p=0.5147;m=2.1277;w=2.3518;r=1.5019;
% h1=0.5;p=0.9;m=2.5;w=1;r=1;% m为非对称因子，r为耦合因子
z=importdata('105.mat');%西储大学数据，105.mat是内圈数据，130.mat是外圈数据，系统参数需要调整
% x2=z(1:20000);
% z=importdata('1815.mat');
% x2=z(1:40000);%路斯亮数据
%  a=1;b=1;w=0.5;r=0.7;
 % x2=z.X130_DE_time(1:10000);%驱动计数端的外圈故障数据1:10000
x2=z.X105_DE_time(10001:20000);%驱动计数端的内圈故障数据10001:20000
% z=importdata('107_XJ.mat');          %西交数据     107.52
% x2=z(1:20000);           %西交数据
D=0.2;
noise=sqrt(2*D)*randn(size(t));
% x=sqrt(2*0.72)*rasd(length(t),1.6,0,1,0);
% x=0;
x1=noise+x2';
% for i=1:length(alpha)

y1=hilbert(x1);
yIn=abs(y1);
y1=yIn-mean(y1);
y2=hilbert(x1);
yIn=abs(y2);
y2=yIn-mean(y2);
y3=hilbert(x1);
yIn=abs(y3);
y3=yIn-mean(y3);
y4=hilbert(x1);
yIn=abs(y4);
y4=yIn-mean(y4);
y5=hilbert(x1);
yIn=abs(y5);
y5=yIn-mean(y5);

% x=sr(a,b,h,y1);
%  x=ouherk(a,V,R,w,r,h,y1);
%   x=ouherksr(a,b,w,r,h,y1);
% x=ouhefd(h1,p,m,w,r,h,y1);
% x=lgkt0(a1,b1,c1,h,y1);

% % % % % % % % % % % % % % % %漫 x=lgkt(a1,b1,c1,k,v,h,y1);

% % x=gupbs_sr(a1,b1,h,v,R,y1);
%x=lgkt_k(k,h,y1);
xu=TDUPQSRlgkt(a1,b1,v,r,c1,e,h,y1);

xc=QSRlgkt(a3,b3,c3,h1,h,y2);
xb=TDCQSRlgkt(a3,b3,c3,h1,c1,e,h,y3);
xd=TDUPQSRlgkt(a2,b2,v2,r2,c1,e,h,y4);
xa=ODUPQSRlgkt(a4,b4,v4,r4,h,y5);
%% 频谱
% y0=fft(x1,10000); 
% py0=y0.*conj(y0)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po0=py0(2:5001);
y0=fft(x1,10000); 
py0=y0.*conj(y0)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po0=py0(2:5001);
%% 包络谱
% y01=fft(y1,10000);
% py01=y01.*conj(y01)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po01=py01(2:5001);
y2=fft(xc,10000);
py01=y2.*conj(y2)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po01=py01(2:5001);
%%
% y1=fft(x,10000); 
% py1=y1.*conj(y1)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po1=py1(2:5001);
y1=fft(xu,10000); 
py1=y1.*conj(y1)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po1=py1(2:5001);
%%
% y1=fft(x,10000); 
% py1=y1.*conj(y1)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po1=py1(2:5001);
y3=fft(xb,10000); 
py2=y3.*conj(y3)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po2=py2(2:5001);
%%
% y1=fft(x,10000); 
% py1=y1.*conj(y1)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po1=py1(2:5001);
y4=fft(xd,10000); 
py3=y4.*conj(y4)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po3=py3(2:5001);
%%
% y1=fft(x,10000); 
% py1=y1.*conj(y1)/10000;
% ff=fs*(1:5000)/10000; 
% ff1=fsr*(1:5000)/10000; 
% po1=py1(2:5001);
y5=fft(xa,10000); 
py4=y5.*conj(y5)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po4=py4(2:5001);
%% 信噪比增益
ff0=find(ff==162);
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));
SNRout1 =10*log10( po1(ff0)/(sum(po1)-po1(ff0)));
SNRI1=SNRout1-SNRin;
SNRout2 =10*log10( po01(ff0)/(sum(po01)-po01(ff0)));
SNRI2=SNRout2-SNRin;
SNRout3 =10*log10( po2(ff0)/(sum(po2)-po2(ff0)));
SNRI3=SNRout3-SNRin;
SNRout4 =10*log10( po3(ff0)/(sum(po3)-po3(ff0)));
SNRI4=SNRout4-SNRin;
SNRout5 =10*log10( po4(ff0)/(sum(po4)-po4(ff0)));
SNRI5=SNRout5-SNRin;
SNRin
SNRout1
SNRout2
SNRout3
SNRout4
SNRout5
SNRI1
SNRI2
SNRI3
SNRI4
SNRI5

figure('name', 'IN');set(gcf,'color','white');
subplot(2,1,1);plot(t,x1,'k');xlim([0 0.3])
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po0,'k');xlim([0 6000]);
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
% subplot(3,1,3)
% plot(ff,po01,'k');xlim([0 6000]);
% xlabel('f/Hz');ylabel('Amplitude');
%%
figure('name', 'TDQGSR');set(gcf,'color','white');
subplot(2,1,1);plot(t,xu,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po1,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
%%
figure('name', 'CQSR');set(gcf,'color','white');
subplot(2,1,1);plot(t,xc,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po01,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
%%
figure('name', 'TDCQSR');set(gcf,'color','white');
subplot(2,1,1);plot(t,xb,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po2,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
%%
figure('name', 'TDTGSR');set(gcf,'color','white');
subplot(2,1,1);plot(t,xd,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po3,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
%%
figure('name', 'QGSR');set(gcf,'color','white');
subplot(2,1,1);plot(t,xa,'k');xlim([0 0.3]);
%  ylim([0 2]);
% title('时域');
xlabel('t/s');ylabel('Amplitude');
subplot(2,1,2);plot(ff,po4,'k');xlim([0 3000]);
% ylim([0 10])
% title('频谱');
xlabel('f/Hz');ylabel('Amplitude');
