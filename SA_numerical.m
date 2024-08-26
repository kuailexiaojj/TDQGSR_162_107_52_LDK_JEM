clc;clear all;close all;

A=0.1;
fs=5;
Ts=1/fs;
N=10000;
t=0:Ts:(N-1)*Ts;

% a=1.51;b=1.8;c=0.45;
% a=1.45;b=1.85;c=0.5;
% w=0.3;
% k=0.7;
% q=1;
% lambda=0.6;
% beta=0.9;
%a1=0.5;b1=1.2;v=0.45;r=1;c=0.5;e=0.005;
a1=0.5;b1=2;v=0.9413;r=0.467;c=0.01;e=0.005;
%a=1.029;b=2.134;c1=3.064;h1=1;
a=1;b=2;c1=3;h1=1;
a3=a.^2;b3=b.^2;c3=c1.^2;
h=1/fs;
f0=0.01;

NN=5000;
ff=fs.*(0:NN/2-1)/NN;
ff0=find(ff==f0);

s=A.*cos(2*pi*f0.*t);
D=linspace(0,5,100);
pout = zeros(size(D));
pout1 = zeros(size(D));
pout2 = zeros(size(D));

for i=1:length(D)
        x=s+sqrt(2*D(i))*randn(1,length(s));
        %x1=TDUPQSRlgkt(a1,b1,v,r,c,e,h,x);

         %x2=TDCQSRlgkt(a3,b3,c3,h1,c,e,h,x);
         x3=QSRlgkt(a3,b3,c3,h1,h,x);
         %x4=TDUPQSRlgkt(a1,0.2,v,r,c,e,h,x);
         %x5=ODUPQSRlgkt(a1,b1,v,r,h,x);
        %pout(i)=SA_num(x,x1,NN,ff0);
        %pout1(i)=SA_num(x,x2,NN,ff0);
        pout2(i)=SA_num(x,x3,NN,ff0);
        %pout3(i)=SA_num(x,x4,NN,ff0);
        %pout4(i)=SA_num(x,x5,NN,ff0);
end

for j=1:20
    %pout=smooth(pout);
    %pout1=smooth(pout1);
    pout2=smooth(pout2);
    %pout3=smooth(pout3);
    %pout4=smooth(pout4);
end


figure(1);
set(gca,'Fontname', 'Times New Roman','FontSize',11)


plot(D,pout2,'c:o','markerfacecolor','c','markersize',2.5,'linewidth',2);
hold on
plot(D,pout,'b:o','markerfacecolor','b','markersize',2.5,'linewidth',2);
hold on
% plot(D,pout4,'g:o','markerfacecolor','g','markersize',2.5,'linewidth',2);
% hold on
% plot(D,pout3,'y:o','markerfacecolor','y','markersize',2.5,'linewidth',2);
% hold on
% plot(D,pout1,'m:o','markerfacecolor','m','markersize',2.5,'linewidth',2);
% hold on
set(legend('CQSR','QGSR','TDQGSR','TDTGSR','TDCQSR'),'Fontname', 'Times New Roman','FontSize', 9);
xlabel('{\it D}','FontSize', 14,'Fontname', 'Times New Roman')
ylabel('{\it SA}','FontSize', 14,'Fontname', 'Times New Roman')
ylim([0,100]);


