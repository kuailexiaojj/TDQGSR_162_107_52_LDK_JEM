%半透明耦合势函数的参数比较
clear all;clc;
a1=0.5;b1=1.2;v=0.45;r=1;c=0.005;e=0.05;
x=-3:0.01:3;
y=-3:0.01:3;
for i=1:length(x)
    for j=1:length(y)
   u(j,i)=((1/2).*a1.*((x(i)+b1).^2)+v.*exp((-(x(i)+b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)<0)+((1/2).*a1.*((x(i)-b1).^2)+v.*exp((-(x(i)-b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)>=0);
    end
end

colormap(cool)
surf(x,y,u);xlim([-2.8 2.8]);ylim([-2.5 2.5])
alpha(0.5)
hold on
a1=0.6;b1=1.2;v=0.45;r=1;c=0.005;e=0.05;
x=-3:0.01:3;
y=-3:0.01:3;
for i=1:length(x)
    for j=1:length(y)
   u(j,i)=((1/2).*a1.*((x(i)+b1).^2)+v.*exp((-(x(i)+b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)<0)+((1/2).*a1.*((x(i)-b1).^2)+v.*exp((-(x(i)-b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)>=0);
    end
end

colormap(cool);colorbar
surf(x,y,u);xlim([-2.8 2.8]);ylim([-2.5 2.5])
alpha(0.5)
hold on
% ylim([1.2 1.3]);
% zlim([-0.08 0.15]);

a1=0.7;b1=1.2;v=0.45;r=1;c=0.005;e=0.05;
x=-3:0.01:3;
y=-3:0.01:3;
for i=1:length(x)
    for j=1:length(y)
   u(j,i)=((1/2).*a1.*((x(i)+b1).^2)+v.*exp((-(x(i)+b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)<0)+((1/2).*a1.*((x(i)-b1).^2)+v.*exp((-(x(i)-b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)>=0);
    end
end
figure(1)
colormap(cool)
surf(x,y,u);xlim([-2.8 2.8]);ylim([-2.5 2.5])
alpha(0.5)
 shading interp
 xlabel('\itx','FontName','Times New Roman','FontSize',15.5);
 ylabel('\ity','FontName','Times New Roman','FontSize',15.5);
 zlabel('\itU(x,y)','FontName','Times New Roman','FontSize',15.5);