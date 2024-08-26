function x=lgkt_SUTSR2(w,k,q,beta,h,x1)
x=zeros(1,length(x1));

for i=1:length(x1)-1
    if x(i)<=-5/4*q
    k1=beta*(-2*w*(x(i)+5*q/4+15*k*q^3/(64*w))+x1(i));
    k2=beta*(-2*w*(x(i)+k1*h/2+5*q/4+15*k*q^3/(64*w))+x1(i)+h/2);
    k3=beta*(-2*w*(x(i)+k2*h/2+5*q/4+15*k*q^3/(64*w))+x1(i)+h/2);
    k4=beta*(-2*w*(x(i)+k3*h+5*q/4+15*k*q^3/(64*w))+x1(i)+h);
    x(i+1)=x(i)+h*(k1+2*k2+2*k3+k4)/6;
    elseif x(i)>-5/4*q&&x(i)<=0
    k1=beta*(-2*k*(x(i)+q).^3+2*k*q.^2*(x(i)+q)+x1(i));
    k2=beta*(-2*k*(x(i)+k1*h/2+q).^3+2*k*q.^2*(x(i)+k1*h/2+q)+x1(i)+h/2);
    k3=beta*(-2*k*(x(i)+k2*h/2+q).^3+2*k*q.^2*(x(i)+k2*h/2+q)+x1(i)+h/2);
    k4=beta*(-2*k*(x(i)+k3*h+q).^3+2*k*q.^2*(x(i)+k3*h+q)+x1(i)+h);
    x(i+1)=x(i)+h*(k1+2*k2+2*k3+k4)/6;
    elseif x(i)>0&&x(i)<=5/4*q
    k1=beta*(-2*k*(x(i)-q).^3+2*k*q.^2*(x(i)-q)+x1(i));
    k2=beta*(-2*k*(x(i)+k1*h/2-q).^3+2*k*q.^2*(x(i)+k1*h/2-q)+x1(i)+h/2);
    k3=beta*(-2*k*(x(i)+k2*h/2-q).^3+2*k*q.^2*(x(i)+k2*h/2-q)+x1(i)+h/2);
    k4=beta*(-2*k*(x(i)+k3*h-q).^3+2*k*q.^2*(x(i)+k3*h-q)+x1(i)+h);
    x(i+1)=x(i)+h*(k1+2*k2+2*k3+k4)/6;
    elseif x(i)>5/4*q
    k1=beta*(-2*w*(x(i)-5*q/4-15*k*q^3/(64*w))+x1(i));
    k2=beta*(-2*w*(x(i)+k1*h/2-5*q/4-15*k*q^3/(64*w))+x1(i)+h/2);
    k3=beta*(-2*w*(x(i)+k2*h/2-5*q/4-15*k*q^3/(64*w))+x1(i)+h/2);
    k4=beta*(-2*w*(x(i)+k3*h-5*q/4-15*k*q^3/(64*w))+x1(i)+h);
    x(i+1)=x(i)+h*(k1+2*k2+2*k3+k4)/6;
    
    end
end


% for i=1:length(x1)-1
%     if x(i)<=-3/2*q
%     k1=beta*(-2*w*(x(i)+3*q/2+3*k*q^3/(8*w))+x1(i));
%     k2=beta*(-2*w*(x(i)+k1*h/2+3*q/2+3*k*q^3/(8*w))+x1(i)+h/2);
%     k3=beta*(-2*w*(x(i)+k2*h/2+3*q/2+3*k*q^3/(8*w))+x1(i)+h/2);
%     k4=beta*(-2*w*(x(i)+k3*h+3*q/2+3*k*q^3/(8*w))+x1(i)+h);
%     x(i+1)=x(i)+h*(k1+2*k2+2*k3+k4)/6;
%     elseif x(i)>-3/2*q&&x(i)<=0
%     k1=beta*(-2*k*(x(i)+q).^3+2*k*q.^2*(x(i)+q)+x1(i));
%     k2=beta*(-2*k*(x(i)+k1*h/2+q).^3+2*k*q.^2*(x(i)+k1*h/2+q)+x1(i)+h/2);
%     k3=beta*(-2*k*(x(i)+k2*h/2+q).^3+2*k*q.^2*(x(i)+k2*h/2+q)+x1(i)+h/2);
%     k4=beta*(-2*k*(x(i)+k3*h+q).^3+2*k*q.^2*(x(i)+k3*h+q)+x1(i)+h);
%     x(i+1)=x(i)+h*(k1+2*k2+2*k3+k4)/6;
%     elseif x(i)>0&&x(i)<=3/2*q
%     k1=beta*(-2*k*(x(i)-q).^3+2*k*q.^2*(x(i)-q)+x1(i));
%     k2=beta*(-2*k*(x(i)+k1*h/2-q).^3+2*k*q.^2*(x(i)+k1*h/2-q)+x1(i)+h/2);
%     k3=beta*(-2*k*(x(i)+k2*h/2-q).^3+2*k*q.^2*(x(i)+k2*h/2-q)+x1(i)+h/2);
%     k4=beta*(-2*k*(x(i)+k3*h-q).^3+2*k*q.^2*(x(i)+k3*h-q)+x1(i)+h);
%     x(i+1)=x(i)+h*(k1+2*k2+2*k3+k4)/6;
%     elseif x(i)>3/2*q
%     k1=beta*(-2*w*(x(i)-3*q/2-3*k*q^3/(8*w))+x1(i));
%     k2=beta*(-2*w*(x(i)+k1*h/2-3/2*q-3*k*q^3/(8*w))+x1(i)+h/2);
%     k3=beta*(-2*w*(x(i)+k2*h/2-3/2*q-3*k*q^3/(8*w))+x1(i)+h/2);
%     k4=beta*(-2*w*(x(i)+k3*h-3/2*q-3*k*q^3/(8*w))+x1(i)+h);
%     x(i+1)=x(i)+h*(k1+2*k2+2*k3+k4)/6;
%     
%     end
% end