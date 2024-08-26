clear,clc
% %%
% %w
% D=0.2;t=pi/2;A1=0.01;A2=0.01;
% w=1;d=2;p=1;r=0.5;
% w1=0.01*2*pi;w2=0.01*2*pi;
% m=w^2*(w-2)*(w-4);n=w*(w-3);
% y=-4:0.01:4;
% x=-4:0.01:4;
% A=sqrt((A1^2+A2^2)/2);lamda=A2/A1;
% beta=sqrt(2/(1+lamda^2))*(x+lamda*y);w=sqrt((w1^2+w2^2)/2);
% uxy1=@(x,y)exp(-1/D*(((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x<-d)+(m/2*x.^2+n/2*x.^4+1/6*x.^6).*(x>=-d).*(x<=d)+((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x>d)+(p/2+r/2)*y.^2+r/2*x.^2-r*x.*y));
% N=dblquad(uxy1,-4,4,-4,4);
% for i=1:length(x) 
%      for j=1:length(y)
%          beta=sqrt(2/(1+lamda^2))*(x(i)+lamda*y(j));w=sqrt((w1^2+w2^2)/2);
%          uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
%          uxyt=uxy-A*beta*cos(w*t);
%          pst(j,i)=1/N*exp(-uxyt/D);
%      end
% end
% figure('Name', 'w:w=1;d=2;p=1;r=0.5');
% surf(x,y,pst,'EdgeColor', 'none');colormap parula;colorbar;
% shading interp;
% 
% D=0.2;t=pi/2;A1=0.01;A2=0.01;
% w=1.2;d=2;p=1;r=0.5;
% w1=0.01*2*pi;w2=0.01*2*pi;
% m=w^2*(w-2)*(w-4);n=w*(w-3);
% y=-4:0.01:4;
% x=-4:0.01:4;
% A=sqrt((A1^2+A2^2)/2);lamda=A2/A1;
% beta=sqrt(2/(1+lamda^2))*(x+lamda*y);w=sqrt((w1^2+w2^2)/2);
% uxy1=@(x,y)exp(-1/D*(((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x<-d)+(m/2*x.^2+n/2*x.^4+1/6*x.^6).*(x>=-d).*(x<=d)+((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x>d)+(p/2+r/2)*y.^2+r/2*x.^2-r*x.*y));
% N=dblquad(uxy1,-4,4,-4,4);
% for i=1:length(x) 
%      for j=1:length(y)
%          beta=sqrt(2/(1+lamda^2))*(x(i)+lamda*y(j));w=sqrt((w1^2+w2^2)/2);
%          uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
%          uxyt=uxy-A*beta*cos(w*t);
%          pst(j,i)=1/N*exp(-uxyt/D);
%      end
% end
% figure('Name', 'w:w=1.2;d=2;p=1;r=0.5');
% surf(x,y,pst,'EdgeColor', 'none');colormap parula;colorbar;
% shading interp;
% %%
% %d
% D=0.2;t=pi/2;A1=0.01;A2=0.01;
% w=1;d=1.8;p=1;r=0.5;
% w1=0.01*2*pi;w2=0.01*2*pi;
% m=w^2*(w-2)*(w-4);n=w*(w-3);
% y=-4:0.01:4;
% x=-4:0.01:4;
% A=sqrt((A1^2+A2^2)/2);lamda=A2/A1;
% beta=sqrt(2/(1+lamda^2))*(x+lamda*y);w=sqrt((w1^2+w2^2)/2);
% uxy1=@(x,y)exp(-1/D*(((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x<-d)+(m/2*x.^2+n/2*x.^4+1/6*x.^6).*(x>=-d).*(x<=d)+((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x>d)+(p/2+r/2)*y.^2+r/2*x.^2-r*x.*y));
% N=dblquad(uxy1,-4,4,-4,4);
% for i=1:length(x) 
%      for j=1:length(y)
%          beta=sqrt(2/(1+lamda^2))*(x(i)+lamda*y(j));w=sqrt((w1^2+w2^2)/2);
%          uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
%          uxyt=uxy-A*beta*cos(w*t);
%          pst(j,i)=1/N*exp(-uxyt/D);
%      end
% end
% figure('Name', 'd:w=1;d=1.8;p=1;r=0.5');
% surf(x,y,pst,'EdgeColor', 'none');colormap parula;colorbar;
% shading interp;
% 
% D=0.2;t=pi/2;A1=0.01;A2=0.01;
% w=1;d=3;p=1;r=0.5;
% w1=0.01*2*pi;w2=0.01*2*pi;
% m=w^2*(w-2)*(w-4);n=w*(w-3);
% y=-4:0.01:4;
% x=-4:0.01:4;
% A=sqrt((A1^2+A2^2)/2);lamda=A2/A1;
% beta=sqrt(2/(1+lamda^2))*(x+lamda*y);w=sqrt((w1^2+w2^2)/2);
% uxy1=@(x,y)exp(-1/D*(((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x<-d)+(m/2*x.^2+n/2*x.^4+1/6*x.^6).*(x>=-d).*(x<=d)+((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x>d)+(p/2+r/2)*y.^2+r/2*x.^2-r*x.*y));
% N=dblquad(uxy1,-4,4,-4,4);
% for i=1:length(x) 
%      for j=1:length(y)
%          beta=sqrt(2/(1+lamda^2))*(x(i)+lamda*y(j));w=sqrt((w1^2+w2^2)/2);
%          uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
%          uxyt=uxy-A*beta*cos(w*t);
%          pst(j,i)=1/N*exp(-uxyt/D);
%      end
% end
% figure('Name', 'd:w=1;d=2;p=1;r=0.5');
% surf(x,y,pst,'EdgeColor', 'none');colormap parula;colorbar;
% shading interp;
% %%
% %r
% D=0.2;t=pi/2;A1=0.01;A2=0.01;
% w=1;d=1.8;p=1;r=0.3;
% w1=0.01*2*pi;w2=0.01*2*pi;
% m=w^2*(w-2)*(w-4);n=w*(w-3);
% y=-4:0.01:4;
% x=-4:0.01:4;
% A=sqrt((A1^2+A2^2)/2);lamda=A2/A1;
% beta=sqrt(2/(1+lamda^2))*(x+lamda*y);w=sqrt((w1^2+w2^2)/2);
% uxy1=@(x,y)exp(-1/D*(((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x<-d)+(m/2*x.^2+n/2*x.^4+1/6*x.^6).*(x>=-d).*(x<=d)+((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x>d)+(p/2+r/2)*y.^2+r/2*x.^2-r*x.*y));
% N=dblquad(uxy1,-4,4,-4,4);
% for i=1:length(x) 
%      for j=1:length(y)
%          beta=sqrt(2/(1+lamda^2))*(x(i)+lamda*y(j));w=sqrt((w1^2+w2^2)/2);
%          uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
%          uxyt=uxy-A*beta*cos(w*t);
%          pst(j,i)=1/N*exp(-uxyt/D);
%      end
% end
% figure('Name', 'r:w=1;d=1.8;p=1;r=0.3');
% surf(x,y,pst,'EdgeColor', 'none');colormap parula;colorbar;
% shading interp;
% 
% D=0.2;t=pi/2;A1=0.01;A2=0.01;
% w=1;d=1.8;p=1;r=0.5;
% w1=0.01*2*pi;w2=0.01*2*pi;
% m=w^2*(w-2)*(w-4);n=w*(w-3);
% y=-4:0.01:4;
% x=-4:0.01:4;
% A=sqrt((A1^2+A2^2)/2);lamda=A2/A1;
% beta=sqrt(2/(1+lamda^2))*(x+lamda*y);w=sqrt((w1^2+w2^2)/2);
% uxy1=@(x,y)exp(-1/D*(((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x<-d)+(m/2*x.^2+n/2*x.^4+1/6*x.^6).*(x>=-d).*(x<=d)+((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x>d)+(p/2+r/2)*y.^2+r/2*x.^2-r*x.*y));
% N=dblquad(uxy1,-4,4,-4,4);
% for i=1:length(x) 
%      for j=1:length(y)
%          beta=sqrt(2/(1+lamda^2))*(x(i)+lamda*y(j));w=sqrt((w1^2+w2^2)/2);
%          uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
%          uxyt=uxy-A*beta*cos(w*t);
%          pst(j,i)=1/N*exp(-uxyt/D);
%      end
% end
% figure('Name', 'r:w=1;d=1.8;p=1;r=0.5');
% surf(x,y,pst,'EdgeColor', 'none');colormap parula;colorbar;
% shading interp;
% %%
% %p
% D=0.2;t=pi/2;A1=0.01;A2=0.01;
% w=1;d=1.8;p=0.5;r=0.5;
% w1=0.01*2*pi;w2=0.01*2*pi;
% m=w^2*(w-2)*(w-4);n=w*(w-3);
% y=-4:0.01:4;
% x=-4:0.01:4;
% A=sqrt((A1^2+A2^2)/2);lamda=A2/A1;
% beta=sqrt(2/(1+lamda^2))*(x+lamda*y);w=sqrt((w1^2+w2^2)/2);
% uxy1=@(x,y)exp(-1/D*(((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x<-d)+(m/2*x.^2+n/2*x.^4+1/6*x.^6).*(x>=-d).*(x<=d)+((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x>d)+(p/2+r/2)*y.^2+r/2*x.^2-r*x.*y));
% N=dblquad(uxy1,-4,4,-4,4);
% for i=1:length(x) 
%      for j=1:length(y)
%          beta=sqrt(2/(1+lamda^2))*(x(i)+lamda*y(j));w=sqrt((w1^2+w2^2)/2);
%          uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
%          uxyt=uxy-A*beta*cos(w*t);
%          pst(j,i)=1/N*exp(-uxyt/D);
%      end
% end
% figure('Name', 'p:w=1;d=1.8;p=0.5;r=0.5');
% surf(x,y,pst,'EdgeColor', 'none');colormap parula;colorbar;
% shading interp;
% 
% D=0.2;t=pi/2;A1=0.01;A2=0.01;
% w=1;d=1.8;p=1;r=0.5;
% w1=0.01*2*pi;w2=0.01*2*pi;
% m=w^2*(w-2)*(w-4);n=w*(w-3);
% y=-4:0.01:4;
% x=-4:0.01:4;
% A=sqrt((A1^2+A2^2)/2);lamda=A2/A1;
% beta=sqrt(2/(1+lamda^2))*(x+lamda*y);w=sqrt((w1^2+w2^2)/2);
% uxy1=@(x,y)exp(-1/D*(((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x<-d)+(m/2*x.^2+n/2*x.^4+1/6*x.^6).*(x>=-d).*(x<=d)+((m+2*n*d^2+d^4)/2*x.^2-n/2*d^4-d^6/3).*(x>d)+(p/2+r/2)*y.^2+r/2*x.^2-r*x.*y));
% N=dblquad(uxy1,-4,4,-4,4);
% for i=1:length(x) 
%      for j=1:length(y)
%          beta=sqrt(2/(1+lamda^2))*(x(i)+lamda*y(j));w=sqrt((w1^2+w2^2)/2);
%          uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
%          uxyt=uxy-A*beta*cos(w*t);
%          pst(j,i)=1/N*exp(-uxyt/D);
%      end
% end
% figure('Name', 'p:w=1;d=1.8;p=1;r=0.5');
% surf(x,y,pst,'EdgeColor', 'none');colormap parula;colorbar;
% shading interp;

%%
%A2
clear all;clc;
D=0.1;t=pi/2;A=0.01;
w=1;a1=0.5;b1=1.2;v=0.45;r=1;c=0.005;e=0.05;
y=-4:0.01:4;
x=-4:0.01:4;
uxy1=@(x,y)exp(-1/D*(((1/2).*a1.*((x+b1).^2)+v.*exp((-(x+b1).^2)./(r.^2))).*(x<0)+((1/2).*a1.*((x-b1).^2)+v.*exp((-(x-b1).^2)./(r.^2))).*(x>=0)+(e/2)*y.^2+(c/2)*((x.^2)+(y.^2))-c.*x.*y));
N=dblquad(uxy1,-4,4,-4,4);
for i=1:length(x) 
     for j=1:length(y)
         
         u=((1/2).*a1.*((x(i)+b1).^2)+v.*exp((-(x(i)+b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)<0)+((1/2).*a1.*((x(i)-b1).^2)+v.*exp((-(x(i)-b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)>=0);
         % uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
         uxyt=u-A*cos(w*t);
         pst(j,i)=1/N*exp(-uxyt/D);
     end
end
figure('Name', 'D=0.1;w=1;a1=0.5;b1=1.2;v=0.45;r=1;c=0.005;e=0.05');
surf(x,y,pst,'EdgeColor', 'none');colormap summer;colorbar;
shading interp;
xlabel('\itx','FontName','Times New Roman','FontSize',15.5);
 ylabel('\ity','FontName','Times New Roman','FontSize',15.5);
 zlabel('\itρ_{SPD}','FontName','Times New Roman','FontSize',15.5);

D=0.1;t=pi/2;A=0.01;
w=1;a1=0.7;b1=1.2;v=0.45;r=1;c=0.005;e=0.05;
y=-4:0.01:4;
x=-4:0.01:4;
uxy1=@(x,y)exp(-1/D*(((1/2).*a1.*((x+b1).^2)+v.*exp((-(x+b1).^2)./(r.^2))).*(x<0)+((1/2).*a1.*((x-b1).^2)+v.*exp((-(x-b1).^2)./(r.^2))).*(x>=0)+(e/2)*y.^2+(c/2)*((x.^2)+(y.^2))-c.*x.*y));
N=dblquad(uxy1,-4,4,-4,4);
for i=1:length(x) 
     for j=1:length(y)
         
         u=((1/2).*a1.*((x(i)+b1).^2)+v.*exp((-(x(i)+b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)<0)+((1/2).*a1.*((x(i)-b1).^2)+v.*exp((-(x(i)-b1).^2)./(r.^2))+1/2*e*y(j).^2+c/2*(x(i).^2+y(j).^2)-c*x(i).*y(j)).*(x(i)>=0);
         % uxy=((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)<-d)+(m/2*x(i).^2+n/2*x(i).^4+1/6*x(i).^6).*(x(i)>=-d).*(x(i)<=d)+((m+2*n*d^2+d^4)/2*x(i).^2-n/2*d^4-d^6/3).*(x(i)>d)+(p/2+r/2)*y(j).^2+r/2*x(i).^2-r*x(i).*y(j);
         uxyt=u-A*cos(w*t);
         pst(j,i)=1/N*exp(-uxyt/D);
     end
end
figure('Name', 'D=0.1;w=1;a1=0.5;b1=1.2;v=0.45;r=1;c=0.015;e=0.05');
surf(x,y,pst,'EdgeColor', 'none');colormap summer;colorbar;
shading interp;
xlabel('\itx','FontName','Times New Roman','FontSize',15.5);
 ylabel('\ity','FontName','Times New Roman','FontSize',15.5);
 zlabel('\itρ_{SPD}','FontName','Times New Roman','FontSize',15.5);