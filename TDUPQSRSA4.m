function eta=TDUPQSRSA4(a1,b1,v,r,c,e,omega,D)
A=1;
%x11=2.*m-sqrt(b1.\a1);x22=m;x33=sqrt(b1.\a1);x44=0;x55=-sqrt(b1.\a1);x66=-m;x77=-2.*m+sqrt(b1.\a1);

xs1=1.97;xs2=0.43;xs4=-xs1;xs3=-xs2;%xs1,xs2>0 (xs1,ys1)(xs2,ys2)是正势阱点  
ys1=0;ys2=0;ys4=-ys1;ys3=-ys2;
xu1=1.2;xu2=0;xu3=-xu1;%xu1>0;(xu1,yu1)是正势阱点
yu1=0;yu2=0;yu3=-yu1;

syms p1(t) p2(t) p3(t) p4(t) t;
[rs12,rs43,rs21,rs34,rs23,rs32]=TDUPQSRkramers4(a1,b1,v,r,c,e);
p1s=zeros(1,length(D));p2s=zeros(1,length(D));p3s=zeros(1,length(D));p4s=zeros(1,length(D));
for m=1:length(D)
eqn1=diff(p1,t)==-rs12(m)*p1+rs21(m)*p2;
eqn2=diff(p2,t)==rs12(m)*p1-(rs21(m)+rs23(m))*p2+rs32(m)*p3;
eqn3=diff(p3,t)==rs23(m)*p2+rs43(m)*p4-(rs32(m)+rs34(m))*p3;
eqn4=diff(p4,t)==rs34(m)*p3-rs43(m)*p4;
eqns=[eqn1,eqn2,eqn3,eqn4];
cond=[p1(0)==0.35,p2(0)==0.3,p3(0)==0.3,p4(0)==0.35];
S=dsolve(eqns,cond);%%%cond为初始条件或者边界条件
p1s(m)=single(subs(S.p1,t,1e5));%给t取得10^5
p2s(m)=single(subs(S.p2,t,1e5));%single将数据类型定义为4个字节
p3s(m)=single(subs(S.p3,t,1e5));
p4s(m)=single(subs(S.p4,t,1e5));
end

%g13=abs(x11-x22);g31=abs(x33-x22);g35=abs(x33-x44);g53=abs(x55-x44);g57=abs(x55-x66);g75=abs(x77-x66);
g12=xu1-xs1;g21=xu1-xs2;g23=xu2-xs2;g32=xu2-xs3;g34=xu3-xs3;g43=xu3-xs4;

amp1=zeros(1,length(D));fa1=zeros(1,length(D));
amp2=zeros(1,length(D));fa2=zeros(1,length(D));
amp3=zeros(1,length(D));fa3=zeros(1,length(D));
amp4=zeros(1,length(D));fa4=zeros(1,length(D));
for m=1:length(D)   
    K=[-rs12(m),rs21(m),0,0;rs12(m),-(rs21(m)+rs23(m)),rs32(m),0;0,rs23(m),-(rs32(m)+rs34(m)),rs43(m);0,0,rs34(m),-rs43(m)];
    [VK,DK]=eig(K);%%%%eig函数---->DK返回特征值的对角矩阵，VK列对应的右特征向量 K*VK=VK*DK
    delta_K=(1/D(m))*[-rs12(m)*g12,rs21(m)*g21,0,0
        rs12(m)*g12,-(rs21(m)*g21+rs23(m)*g23),rs32(m)*g32,0
        0,rs23(m)*g23,-(rs32(m)*g32+rs34(m)*g34),rs43(m)*g43
        0,0,rs34(m)*g34,-rs43(m)*g43];
    P0=[p1s(m);p2s(m);p3s(m);p4s(m)];
    F=delta_K*P0;
    gama=(F'/VK)';
    denoA=omega./(diag(DK).^2+omega^2);%%%%%返回一个几行一列的矩阵
    A1=sum(denoA.*gama.*VK(:,1));%w 第一列
    A2=sum(denoA.*gama.*VK(:,2));%gama -> m
    A3=sum(denoA.*gama.*VK(:,3));
    A4=sum(denoA.*gama.*VK(:,4));
    denoB=diag(DK)./(diag(DK).^2+omega^2);
    B1=-sum(denoB.*gama.*VK(:,1));%h
    B2=-sum(denoB.*gama.*VK(:,2));
    B3=-sum(denoB.*gama.*VK(:,3));
    B4=-sum(denoB.*gama.*VK(:,4));
    R1=A1^2+B1^2;R2=A2^2+B2^2;R3=A3^2+B3^2;R4=A4^2+B4^2;
    fa1(m)=atan(B1/A1);fa2(m)=atan(B2/A2);fa3(m)=atan(B3/A3);fa4(m)=atan(B4/A4);
    amp1(m)=A*sqrt(R1);
    amp2(m)=A*sqrt(R2);
    amp3(m)=A*sqrt(R3);  
    amp4(m)=A*sqrt(R4); 
end
T1=sqrt((xs1.^2).*(amp1.^2)+(xs2.^2).*(amp2.^2)+2.*xs1.*amp1.*xs2.*amp2.*cos(fa1-fa2));
T2=sqrt((xs3.^2).*(amp3.^2)+(xs4.^2).*(amp4.^2)+2.*xs3.*amp3.*xs4.*amp4.*cos(fa3-fa4));
Q1=atan(((xs1.*amp1)-(xs2.*amp2))./((xs1.*amp1)+(xs2.*amp2)).*tan((fa1-fa2)/2));
Q2=atan(((xs3.*amp3)-(xs4.*amp4))./((xs3.*amp3)+(xs4.*amp4)).*tan((fa3-fa4)/2));
E=T1.^2+T2.^2+2.*T1.*T2.*cos(Q1-Q2);

eta=E./(A.^2);
end