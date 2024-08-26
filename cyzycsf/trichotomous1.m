function noise = trichotomous1(q,tao,taocor,t,a,b,c)
%q是概率， a,b,c三个值， 噪声相关时间taocor, 时刻tao,时间终止时刻tend
%概率：Ps(a)=Ps(c)=q, Ps(b)=1-2q
%转移概率Paa,Pab,Pac,Pba,Pbb,Pbc,Pca,Pcb,Pcc

%三个值a,b,c之间的转移概率
% t 时刻转移到 t+tao 时刻
%Pxy=P(y,t+tao|x,t),x->y(时刻 t->t+tao)
v=1/taocor;
e=exp(-v*tao);
Paa=q-(q-1)*e;
Pba=q*(1-e);
Pca=q*(1-e);
Pab=(1-2*q)*(1-e);
Pbb=1-2*q*(1-e);
Pcb=(1-2*q)*(1-e);
Pac=q*(1-e);
Pbc=q*(1-e);
Pcc=q-(q-1)*e;
%% 主程序
warning off;
if q>0.5
    errordlg('请输入正确数值q','警告');
    return;
end
if q<0.5
x=[a,b,c];
xn=x(randi([1 length(x)],1,1));%随机选三个值中的一个
end
if q==0.5
    x=[a,c];
    xn=x(randi([1 length(x)],1,1));%随机选三个值中的一个
end
% t=0:tao:tend;
noise=zeros(size(t));
noise(1)=xn;
for i=1:length(t)-1
    Rn=rand(1,1);
    if noise(i)==a
        if Rn<=Paa  %如果Rn小于Paa,则下一时刻t+tao取值a
            noise(i+1)=a;
        elseif Rn>Paa && Rn<=(Paa+Pab)%是否要等号
            noise(i+1)=b;
        else
            noise(i+1)=c;
        end
    end
    if noise(i)==b
        if Rn<=Pba  %如果Rn小于Paa,则下一时刻t+tao取值a
            noise(i+1)=a;
        elseif Rn>Pba && Rn<=(Pba+Pbb)
            noise(i+1)=b;
        else
            noise(i+1)=c;
        end
    end
    if noise(i)==c
        if Rn<=Pca  %如果Rn小于Paa,则下一时刻t+tao取值a
            noise(i+1)=a;
        elseif Rn>Pca && Rn<=(Pca+Pcb)
            noise(i+1)=b;
        else
            noise(i+1)=c;
        end
    end      
end





















end

