function [x_out]=olgkt(a,b,c,d,r,h,x_in)
x=zeros(1,length(x_in));
y=zeros(1,length(x_in));
x(1)=0.01;
y(1)=0.01;
for i=1:length(x_in)-1
    k1=h*(-a*x(i)+b*x(i)^3-c*x(i)^5)+r*(y(i)-x(i))+x_in(i);
    f1=h*(-d*y(i)+r*(x(i)-y(i)));
    k2=h*(-a*(x(i)+k1/2)+b*(x(i)+k1/2)^3-c*(x(i)+k1/2)^5+r*((y(i)+f1/2)-(x(i)+k1/2))+x_in(i));
    f2=h*(-d*(y(i)+f1/2)+r*((x(i)+k1/2)-(y(i)+f1/2)));
    k3=h*(-a*(x(i)+k2/2)+b*(x(i)+k2/2)^3-c*(x(i)+k2/2)^5+r*((y(i)+f2/2)-(x(i)+k2/2))+x_in(i+1));
    f3=h*(-d*(y(i)+f2/2)+r*((x(i)+k2/2)-(y(i)+f2/2)));
    k4=h*(-a*(x(i)+k3)+b*(x(i)+k3)^3-c*(x(i)+k3)^5+r*((y(i)+f3)-(x(i)+k3))+x_in(i+1));
    f4=h*(-d*(y(i)+f3)+r*((x(i)+k3)-(y(i)+f3)));
    x(i+1)=x(i)+(1/6)*(k1+2*k2+2*k3+k4);
    y(i+1)=y(i)+(1/6)*(f1+2*f2+2*f3+f4);
    x_out=x;
end