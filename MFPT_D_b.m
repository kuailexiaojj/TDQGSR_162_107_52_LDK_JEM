clear all;clc;
a1=0.5;b1=1.2;v=0.45;r=1;c=0.005;e=0.05;A=0.3;
xs1=1.95;xs2=0.44;xs4=-xs1;xs3=-xs2;%xs1,xs2>0 (xs1,ys1)(xs2,ys2)是正势阱点  
ys1=0.178;ys2=0.04;ys4=-ys1;ys3=-ys2;
xu1=1.21;xu2=0;xu3=-xu1;%xu1>0;(xu1,yu1)是正势阱点
yu1=0.11;yu2=0;yu3=-yu1;
D=0.001:0.005:0.35;
us1=((1/2).*a1.*((xs1-b1).^2)+v.*exp((-(xs1-b1).^2)./(r.^2)))+(e/2)*ys1.^2+(c/2)*((xs1.^2)+(ys1.^2))-c.*xs1.*ys1;
us2=((1/2).*a1.*((xs2-b1).^2)+v.*exp((-(xs2-b1).^2)./(r.^2)))+(e/2)*ys2.^2+(c/2)*((xs2.^2)+(ys2.^2))-c.*xs2.*ys2;
us4=us1;us3=us2;
uu1=((1/2).*a1.*((xu1-b1).^2)+v.*exp((-(xu1-b1).^2)./(r.^2)))+(e/2)*yu1.^2+(c/2)*((xu1.^2)+(yu1.^2))-c.*xu1.*yu1;
uu2=((1/2).*a1.*((xu2-b1).^2)+v.*exp((-(xu2-b1).^2)./(r.^2)))+(e/2)*yu2.^2+(c/2)*((xu2.^2)+(yu2.^2))-c.*xu2.*yu2;
uu3=uu1;
js1=2*v.*(((r.^2)-2*(xs1-b1).^2)./r.^4).*exp(-((xs1-b1).^2)./r.^2)-a1-e;
js2=2*v.*(((r.^2)-2*(xs1-b1).^2)./r.^4).*exp(-((xs1-b1).^2)./r.^2)-a1-e;
ju1=2*v.*(((r.^2)-2*(xu1-b1).^2)./r.^4).*exp(-((xu1-b1).^2)./r.^2)-a1-e;
ju2=2*v.*(((r.^2)-2*(xu2-b1).^2)./r.^4).*exp(-((xu2-b1).^2)./r.^2)-a1-e;
ls1z=(1/2).*(js1-e-c+sqrt((js1+e+c).^2+4*c.^2));ls1f=(1/2).*(js1-e-c-sqrt((js1+e+c).^2+4*c.^2));%势阱点特征值
ls2z=(1/2).*(js2-e-c+sqrt((js2+e+c).^2+4*c.^2));ls2f=(1/2).*(js2-e-c-sqrt((js2+e+c).^2+4*c.^2));
bu1z=(1/2).*(ju1-e-c+sqrt((ju1+e+c).^2+4*c.^2));bu1f=(1/2).*(ju1-e-c-sqrt((ju1+e+c).^2+4*c.^2));%势垒点特征值
bu2z=(1/2).*(ju2-e-c+sqrt((ju2+e+c).^2+4*c.^2));bu2f=(1/2).*(ju2-e-c-sqrt((ju2+e+c).^2+4*c.^2));
rs12=(1./(2*pi))*sqrt(ls1z.*ls1f.*bu1z./abs(bu1f)).*exp((-1./D).*(uu1-us1));
rs21=(1./(2*pi))*sqrt(ls2z.*ls2f.*bu1z./abs(bu1f)).*exp((-1./D).*(uu1-us2));
rs23=(1./(2*pi))*sqrt(ls2z.*ls2f.*bu2z./abs(bu2f)).*exp((-1./D).*(uu2-us2));
Ts112=log(rs12.^-1);Ts121=log(rs21.^-1);Ts123=log(rs23.^-1);

a1=0.5;b1=1.4;v=0.45;r=1;c=0.005;e=0.05;A=0.3;
xs1=2.15;xs2=0.63;xs4=-xs1;xs3=-xs2;%xs1,xs2>0 (xs1,ys1)(xs2,ys2)是正势阱点  
ys1=0.196;ys2=0.057;ys4=-ys1;ys3=-ys2;
xu1=1.42;xu2=0;xu3=-xu1;%xu1>0;(xu1,yu1)是正势阱点
yu1=0.129;yu2=0;yu3=-yu1;
D=0.001:0.005:0.35;
us1=((1/2).*a1.*((xs1-b1).^2)+v.*exp((-(xs1-b1).^2)./(r.^2)))+(e/2)*ys1.^2+(c/2)*((xs1.^2)+(ys1.^2))-c.*xs1.*ys1;
us2=((1/2).*a1.*((xs2-b1).^2)+v.*exp((-(xs2-b1).^2)./(r.^2)))+(e/2)*ys2.^2+(c/2)*((xs2.^2)+(ys2.^2))-c.*xs2.*ys2;
us4=us1;us3=us2;
uu1=((1/2).*a1.*((xu1-b1).^2)+v.*exp((-(xu1-b1).^2)./(r.^2)))+(e/2)*yu1.^2+(c/2)*((xu1.^2)+(yu1.^2))-c.*xu1.*yu1;
uu2=((1/2).*a1.*((xu2-b1).^2)+v.*exp((-(xu2-b1).^2)./(r.^2)))+(e/2)*yu2.^2+(c/2)*((xu2.^2)+(yu2.^2))-c.*xu2.*yu2;
uu3=uu1;
js1=2*v.*(((r.^2)-2*(xs1-b1).^2)./r.^4).*exp(-((xs1-b1).^2)./r.^2)-a1-e;
js2=2*v.*(((r.^2)-2*(xs1-b1).^2)./r.^4).*exp(-((xs1-b1).^2)./r.^2)-a1-e;
ju1=2*v.*(((r.^2)-2*(xu1-b1).^2)./r.^4).*exp(-((xu1-b1).^2)./r.^2)-a1-e;
ju2=2*v.*(((r.^2)-2*(xu2-b1).^2)./r.^4).*exp(-((xu2-b1).^2)./r.^2)-a1-e;
ls1z=(1/2).*(js1-e-c+sqrt((js1+e+c).^2+4*c.^2));ls1f=(1/2).*(js1-e-c-sqrt((js1+e+c).^2+4*c.^2));%势阱点特征值
ls2z=(1/2).*(js2-e-c+sqrt((js2+e+c).^2+4*c.^2));ls2f=(1/2).*(js2-e-c-sqrt((js2+e+c).^2+4*c.^2));
bu1z=(1/2).*(ju1-e-c+sqrt((ju1+e+c).^2+4*c.^2));bu1f=(1/2).*(ju1-e-c-sqrt((ju1+e+c).^2+4*c.^2));%势垒点特征值
bu2z=(1/2).*(ju2-e-c+sqrt((ju2+e+c).^2+4*c.^2));bu2f=(1/2).*(ju2-e-c-sqrt((ju2+e+c).^2+4*c.^2));
rs12=(1./(2*pi))*sqrt(ls1z.*ls1f.*bu1z./abs(bu1f)).*exp((-1./D).*(uu1-us1));
rs21=(1./(2*pi))*sqrt(ls2z.*ls2f.*bu1z./abs(bu1f)).*exp((-1./D).*(uu1-us2));
rs23=(1./(2*pi))*sqrt(ls2z.*ls2f.*bu2z./abs(bu2f)).*exp((-1./D).*(uu2-us2));
Ts212=log(rs12.^-1);Ts221=log(rs21.^-1);Ts223=log(rs23.^-1);

a1=0.5;b1=1.6;v=0.45;r=1;c=0.005;e=0.05;A=0.3;
xs1=2.35;xs2=0.83;xs4=-xs1;xs3=-xs2;%xs1,xs2>0 (xs1,ys1)(xs2,ys2)是正势阱点  
ys1=0.214;ys2=0.076;ys4=-ys1;ys3=-ys2;
xu1=1.62;xu2=0;xu3=-xu1;%xu1>0;(xu1,yu1)是正势阱点
yu1=0.147;yu2=0;yu3=-yu1;
D=0.001:0.005:0.35;
us1=((1/2).*a1.*((xs1-b1).^2)+v.*exp((-(xs1-b1).^2)./(r.^2)))+(e/2)*ys1.^2+(c/2)*((xs1.^2)+(ys1.^2))-c.*xs1.*ys1;
us2=((1/2).*a1.*((xs2-b1).^2)+v.*exp((-(xs2-b1).^2)./(r.^2)))+(e/2)*ys2.^2+(c/2)*((xs2.^2)+(ys2.^2))-c.*xs2.*ys2;
us4=us1;us3=us2;
uu1=((1/2).*a1.*((xu1-b1).^2)+v.*exp((-(xu1-b1).^2)./(r.^2)))+(e/2)*yu1.^2+(c/2)*((xu1.^2)+(yu1.^2))-c.*xu1.*yu1;
uu2=((1/2).*a1.*((xu2-b1).^2)+v.*exp((-(xu2-b1).^2)./(r.^2)))+(e/2)*yu2.^2+(c/2)*((xu2.^2)+(yu2.^2))-c.*xu2.*yu2;
uu3=uu1;
js1=2*v.*(((r.^2)-2*(xs1-b1).^2)./r.^4).*exp(-((xs1-b1).^2)./r.^2)-a1-e;
js2=2*v.*(((r.^2)-2*(xs1-b1).^2)./r.^4).*exp(-((xs1-b1).^2)./r.^2)-a1-e;
ju1=2*v.*(((r.^2)-2*(xu1-b1).^2)./r.^4).*exp(-((xu1-b1).^2)./r.^2)-a1-e;
ju2=2*v.*(((r.^2)-2*(xu2-b1).^2)./r.^4).*exp(-((xu2-b1).^2)./r.^2)-a1-e;
ls1z=(1/2).*(js1-e-c+sqrt((js1+e+c).^2+4*c.^2));ls1f=(1/2).*(js1-e-c-sqrt((js1+e+c).^2+4*c.^2));%势阱点特征值
ls2z=(1/2).*(js2-e-c+sqrt((js2+e+c).^2+4*c.^2));ls2f=(1/2).*(js2-e-c-sqrt((js2+e+c).^2+4*c.^2));
bu1z=(1/2).*(ju1-e-c+sqrt((ju1+e+c).^2+4*c.^2));bu1f=(1/2).*(ju1-e-c-sqrt((ju1+e+c).^2+4*c.^2));%势垒点特征值
bu2z=(1/2).*(ju2-e-c+sqrt((ju2+e+c).^2+4*c.^2));bu2f=(1/2).*(ju2-e-c-sqrt((ju2+e+c).^2+4*c.^2));
rs12=(1./(2*pi))*sqrt(ls1z.*ls1f.*bu1z./abs(bu1f)).*exp((-1./D).*(uu1-us1));
rs21=(1./(2*pi))*sqrt(ls2z.*ls2f.*bu1z./abs(bu1f)).*exp((-1./D).*(uu1-us2));
rs23=(1./(2*pi))*sqrt(ls2z.*ls2f.*bu2z./abs(bu2f)).*exp((-1./D).*(uu2-us2));
Ts312=log(rs12.^-1);Ts321=log(rs21.^-1);Ts323=log(rs23.^-1);
plot(D,Ts112,'g-','linewidth',1);hold on
plot(D,Ts121,'g-.','linewidth',1);hold on
plot(D,Ts123,'g-*','linewidth',1);hold on
plot(D,Ts212,'b-','linewidth',1);hold on
plot(D,Ts221,'b-.','linewidth',1);hold on
plot(D,Ts223,'b-*','linewidth',1);hold on
plot(D,Ts312,'m-','linewidth',1);hold on
plot(D,Ts321,'m-.','linewidth',1);hold on
plot(D,Ts323,'m-*','linewidth',1);

ylim([0,30])
xlabel('\itD','FontName','Times New Roman','FontSize',15.5);
 ylabel('\itT_{s12}&T_{s21}&T_{s23}','FontName','Times New Roman','FontSize',15.5);
legend('T_{s12},b=1.2','T_{s21},b=1.2','T_{s23},b=1.2','T_{s12},b=1.4','T_{s21},b=1.4','T_{s23},b=1.4','T_{s12},b=1.6','T_{s21},b=1.6','T_{s23},b=1.6')
axes('position',[0.55,0.55,0.3,0.3]); %关键在这句！所画的小图
plot(D,Ts112,'g-',D,Ts121,'g-.',D,Ts123,'g-*',D,Ts212,'b-',D,Ts221,'b-.',D,Ts223,'b-*',D,Ts312,'m-',D,Ts321,'m-.',D,Ts323,'m-*','LineWidth',1.5);

ylim([0 30])