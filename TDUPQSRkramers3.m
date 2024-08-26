function [rs12,rs43,rs21,rs34,rs23,rs32]=TDUPQSRkramers3(a1,b1,v,r,c,e)

xs1=1.95;xs2=0.43;xs4=-xs1;xs3=-xs2;%xs1,xs2>0 (xs1,ys1)(xs2,ys2)是正势阱点  
ys1=0.06;ys2=0.01;ys4=-ys1;ys3=-ys2;
xu1=1.21;xu2=0;xu3=-xu1;%xu1>0;(xu1,yu1)是正势阱点
yu1=0.04;yu2=0;yu3=-yu1;

D=linspace(0.01,3,100);
us1=((1/2).*a1.*((xs1-b1).^2)+v.*exp((-(xs1-b1).^2)./(r.^2)))+(e/2)*ys1.^2+(c/2)*((xs1.^2)+(ys1.^2))-c.*xs1.*ys1;
us2=((1/2).*a1.*((xs2-b1).^2)+v.*exp((-(xs2-b1).^2)./(r.^2)))+(e/2)*ys2.^2+(c/2)*((xs2.^2)+(ys2.^2))-c.*xs2.*ys2;
%us4=us1;us3=us2;
uu1=((1/2).*a1.*((xu1-b1).^2)+v.*exp((-(xu1-b1).^2)./(r.^2)))+(e/2)*yu1.^2+(c/2)*((xu1.^2)+(yu1.^2))-c.*xu1.*yu1;
uu2=((1/2).*a1.*((xu2-b1).^2)+v.*exp((-(xu2-b1).^2)./(r.^2)))+(e/2)*yu2.^2+(c/2)*((xu2.^2)+(yu2.^2))-c.*xu2.*yu2;
%uu3=uu1;
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
rs43=rs12;rs34=rs21;rs32=rs23;
end