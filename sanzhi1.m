clc;clear all;
fs=5;
Ts=1/fs;
N=10000;
t=0:Ts:(N-1)*Ts;

f0=0.01;
s=0.1*cos(2*pi*f0.*t);%+0.1*cos(2*pi*0.03*t);
% N_sample=25600;
%q是概率， a,b,c三个值， 噪声相关时间taocor, 时刻tao,时间终止时刻tend
q=0.4;tao=1/fs;taocor=0.2;tend=10;
a3=1;b3=0;c3=-1;
D=taocor*(a3^2*q+b3^2*(1-2*q)+c3^2*q-(a3*q+b3*(1-2*q)+c3*q)^2); 
t1=0:tao:(N-1)*tao;
noise = trichotomous1(q,tao,taocor,t1,a3,b3,c3);
figure(1)
subplot(2,2,4)
plot(t,noise)
 xlim([0,10]);
ylim([-1,1]);