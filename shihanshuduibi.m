x= -3.5:0.1:3.5;
%a1=0.5;b1=1.2;v=0.45;r=1;
a1=1;b1=1.63;v=0.6;r=1;
b2=sqrt((-r.^2).*log((a1.*r.^2)./(2.*v)));
b2

%b1>b2即可
y1=((1/2).*a1.*((x+b1).^2)+v.*exp((-(x+b1).^2)./(r.^2))).*(x<0)+((1/2).*a1.*((x-b1).^2)+v.*exp((-(x-b1).^2)./(r.^2))).*(x>=0);
%y2=-a2.*x.*sin(2*pi.*f1.*x);
%y2=((1/2).*a1.*((x+b1).^2)+v.*exp((-(x+b1).^2)./(r.^2))).*(x<0)+((1/2).*a1.*((x-b1).^2)+v.*exp((-(x-b1).^2)./(r.^2))).*(x>=0);

plot(x,y1,'m-p','LineWidth',1.5)
hold on
a1=0.5;b1=0.5;v=0.45;r=1;
y2=((1/2).*a1.*((x+b1).^2)+v.*exp((-(x+b1).^2)./(r.^2))).*(x<0)+((1/2).*a1.*((x-b1).^2)+v.*exp((-(x-b1).^2)./(r.^2))).*(x>=0);
plot(x,y2,'b-.','LineWidth',1.5) 
hold on
a1=0.65;b1=1.3;c1=1;
y3=-(1/2)*((a1.^2).*(b1.^2).*(c1.^2).*x.^2)+(1/4)*((a1.^2).*(b1.^2)+(b1.^2).*(c1.^2)+(c1.^2).*(a1.^2)).*x.^4-(1/6)*(a1.^2+b1.^2+c1.^2).*x.^6+(1/8)*x.^8+0.4666;
plot(x,y3,'g-h','LineWidth',1.5) 
ylim([0.35,0.7])
h2=legend('$U(x),b>\sqrt{-{{R}^{2}}\ln \left( {a{{R}^{2}}}/{2V}\; \right)}$','$U(x),0<b\le \sqrt{-{{R}^{2}}\ln \left( {a{{R}^{2}}}/{2V}\; \right)}$','${{U}_{0}}(x)$');
set(h2,'Interpreter','latex')