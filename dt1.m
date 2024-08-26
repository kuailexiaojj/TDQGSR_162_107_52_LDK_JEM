clear all;close all;clc
fs=12000;fsr=5;
N=10000;
Ts=1/fs;
h=1/fsr;%时间步长，二次样频率
t=0:Ts:9999*Ts;            

% a=0.1001;b=0.3536;c=0.0508;d=2.1208;r=2.2011;
% a1=0.0815;b1=0.3738;c1=0.0468;d1=2.4508;m=0.2611;r1=2.4528;

% a=0.1041;b=0.3509;c=0.0512;d=2.4316;r=2.5069;
% a1=0.0719;b1=0.4135;c1=0.0548;d1=2.8208;m=0.502;r1=2.8328;
a=1.6797;b=1.1919;c=3.710;h1=0.001;cc=0.194628;ee=0.90661;
a2=a.^2;b2=b.^2;c2=c.^2;
a1=0.9033;b1=2.9518;v=2.67905;r1=0.1094;c1=0.0194628;e=0.090661;b9=0.1268;
%a1=1;b1=0.8;v=2.5;r1=1.181;c1=0.01;e=0.51;
%a1=0.01;b1=0.61162;v=0.68747;r1=0.3197;c1=0.38284;e=0.47609;
a4=0.8;b4=1.9;v4=0.5;r4=1;
z=importdata('105.mat');%西储大学数据，105.mat是内圈数据，130.mat是外圈数据，系统参数需要调整
% a=1;b=1;w=0.5;r=0.7;
   %x2=z.X130_DE_time(1:10000);%驱动计数端的外圈故障数据1:10000
 x2=z.X105_DE_time(10001:20000);%驱动计数端的内圈故障数据10001:20000
 
D=0.3;
noise1=sqrt(2*D)*randn(size(t));
%三值噪声
q=0.3;tao=1/200;taocor=2;tend=10;
a3=0.5;b3=0;c3=-a3;
D1=taocor*(a3^2*q+b3^2*(1-2*q)+c3^2*q-(a3*q+b3*(1-2*q)+c3*q)^2)
t1=0:tao:(length(t)-1)*tao;
noise = trichotomous1(q,tao,taocor,t1,a3,b3,c3);
figure(5)
plot(t1,noise)
%levy
noise2=sqrt(2*0.02)*rasd(length(t),1.6,0,1,0);
noise3=sqrt(2*0.01)*rasd(length(t),1.6,0,1,0);
%x1=noise+noise1+noise2+x2';
x1=noise+noise1+x2';
xx1=noise+noise1+x2';
y1=hilbert(x1);
yIn=abs(y1);
y1=yIn-mean(x1);
yy1=hilbert(xx1);
yyIn=abs(yy1);
yy1=yyIn-mean(x1);
xx=TDCQSRlgkt(a2,b2,c2,h1,cc,ee,h,yy1);
xxx=TDUPQSRlgkt(a1,b1,v,r1,c1,e,h,y1);
xxxx=TDUPQSRlgkt(a1,b9,v,r1,c1,e,h,y1);

y0=fft(x1,10000); %%orignal
py0=y0.*conj(y0)/10000;
ff=fs*(1:5000)/10000;
ff1=fsr*(1:5000)/10000; 
po0=py0(2:5001);

%处理后
y=fft(xx,10000); %%TDCQSR
py1=y.*conj(y)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po1=py1(2:5001);

y1=fft(xxx,10000); %%TDQGSR
py2=y1.*conj(y1)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po2=py2(2:5001);

y2=fft(xxxx,10000); %%TDTGSR
py3=y2.*conj(y2)/10000;
ff=fs*(1:5000)/10000; 
ff1=fsr*(1:5000)/10000; 
po3=py3(2:5001);

%% 信噪比增益
ff0=find(ff==162)
SNRin = 10*log10(po0(ff0)/(sum(po0)-po0(ff0)));
SNRout1 =10*log10( po1(ff0)/(sum(po1)-po1(ff0)));
SNRout2 =10*log10( po2(ff0)/(sum(po2)-po2(ff0)));
SNRout3 =10*log10( po3(ff0)/(sum(po3)-po3(ff0)));
SNRin
SNRout1
SNRout2
SNRout3
SNRG1=SNRout1-SNRin
SNRG2=SNRout2-SNRin
SNRG3=SNRout3-SNRin
figure('name', 'ALL');set(gcf,'color','white');

subplot(2,2,1);plot(ff,po0,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(a)','Fontname', 'Times New Roman','FontSize',12);

subplot(2,2,2);plot(ff,po1,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(b)','Fontname', 'Times New Roman','FontSize',12);
subplot(2,2,3);plot(ff,po2,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(c)','Fontname', 'Times New Roman','FontSize',12);
subplot(2,2,4);plot(ff,po3,'k');xlim([0 3000]);
xlabel('\itf/Hz','Fontname', 'Times New Roman','FontSize',9.9);ylabel('\itAmplitude','Fontname', 'Times New Roman','FontSize',12);title('(d)','Fontname', 'Times New Roman','FontSize',12);
