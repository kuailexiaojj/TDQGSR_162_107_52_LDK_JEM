%耦合势函数模型以及等高线
clear all;close all;clc;
[x,y]=meshgrid(-2.5:0.01:2.5,-2.5:0.01:2.5);
%a1=0.6;b1=1.3;c1=1;c=0.005;e=0.05;%TDCQSR
%a1=0.5;b1=1.2;v=0.45;r=1;c=0.005;e=0.05;%TDQGSR
a1=0.5;b1=0.2;v=0.45;r=1;c=0.005;e=0.05;%TDTGSR
%a1=0.25;b1=7.5;v=0.5;r=2;c=0.1;e=0.5;
%u1=-(1/2)*((a1.^2).*(b1.^2).*(c1.^2).*x.^2)+(1/4)*((a1.^2).*(b1.^2)+(b1.^2).*(c1.^2)+(c1.^2).*(a1.^2)).*x.^4-(1/6)*(a1.^2+b1.^2+c1.^2).*x.^6+(1/8)*x.^8;
u1=((1/2).*a1.*((x+b1).^2)+v.*exp((-(x+b1).^2)./(r.^2))).*(x<0)+((1/2).*a1.*((x-b1).^2)+v.*exp((-(x-b1).^2)./(r.^2))).*(x>=0);
u=u1+(e/2)*y.^2+(c/2)*((x.^2)+(y.^2))-c.*x.*y;
%u=u1+(d/2)*y.^2-(k/2)*x.^2.*y.^2;
% mesh(x,y,u)

mesh(x,y,u);colormap cool;colorbar;alpha(0.1)
xlabel('\itx','FontName','Times New Roman','FontSize',15.5);
 ylabel('\ity','FontName','Times New Roman','FontSize',15.5);
 zlabel('\itU(x,y)','FontName','Times New Roman','FontSize',15.5);
hold on
figure(2)        
 %[xs,ys]=solve('a*x.^5-b*x.^3+c*x-k*x.*y.^2==0','c*y-k*x.^2.*y==0','x','y');
% scatter(xs(1:7),ys(1:7),'m');hold on;
 [C,h] = contour(x,y,u);
 set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2);
 colormap cool;box on;
 xlabel('\itx','FontName','Times New Roman','FontSize',15.5);
 ylabel('\ity','FontName','Times New Roman','FontSize',15.5);