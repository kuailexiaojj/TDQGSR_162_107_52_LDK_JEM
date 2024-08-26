 clear all;close all;
clc 
% fs=5;
% Ts=1/fs; 
% h=1/fs;   %时间步长 
% t=0:Ts:4000*Ts;
% %a3=2.8;b3=2.9;c3=3;h1=1;%可行
% a3=2.6;b3=2.8;c3=3;h1=1;
% s=0.3*sin(2*pi*0.01*t);
% x1=QSRlgkt(a3,b3,c3,h1,h,s);
% % x1=lgkt0(a1,b1,c1,h,s);
% plot(s,x1)
% hold on
% s=1*sin(2*pi*0.01*t);
% % x1=lgkt0(a1,b1,c1,h,s);
% x1=QSRlgkt(a3,b3,c3,h1,h,s);
% plot(s,x1)
% hold on
% s=1.5*sin(2*pi*0.01*t);
% % x1=lgkt0(a1,b1,c1,h,s);
% x1=QSRlgkt(a3,b3,c3,h1,h,s);
% plot(s,x1)
% hold on
% s=2*sin(2*pi*0.01*t);
% % x1=lgkt0(a1,b1,c1,h,s);
% x1=QSRlgkt(a3,b3,c3,h1,h,s);
% plot(s,x1)
% 
% ylim([-6 6])    
% legend('A=0.3','A=1','A=1.5','A=2')
am=0:0.1:3;
% a3=0.65;b3=1;c3=1.3;h1=1;t=25;
a3=3.9;b3=1.5;c3=1.6;h1=1;t=25;h=1/5;
a1=0.65;b1=4.9;v=0.45;r=1;c=0.05;e=0.05;
%a1=0.65;b1=1.5;v=0.45;r=1;c=0.05;e=0.05;
s=am.*sin(2*pi*0.01*t);
%x1=QSRlgkt(a3,b3,c3,h1,h,s);
x1=TDCQSRlgkt(a3,b3,c3,h1,c,e,h,s);
plot(am,x1,'m-.p','LineWidth',1.5)
hold on
x2=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
plot(am,x2,'c-.o','LineWidth',1.5)
hold on
b1=0.2;
x2=TDUPQSRlgkt(a1,b1,v,r,c,e,h,s);
plot(am,x2,'b-.s','LineWidth',1.5)
h2=legend('${{U}_{0}}(x)$','$U(x),b>\sqrt{-{{R}^{2}}\ln \left( {a{{R}^{2}}}/{2V}\; \right)}$','$U(x),0<b\le \sqrt{-{{R}^{2}}\ln \left( {a{{R}^{2}}}/{2V}\; \right)}$');
set(h2,'Interpreter','latex')