function SAout = SA_num(x,x1,NN,ff0)
%Ƶ�׷Ŵ����棨Spectral Amplification��SA��
%ff0Ϊ���Ƶ������Ƶ������f�ĵ���λ��

y=fft(x,NN);%�����ź�x��Ƶ��
py=y.*conj(y)/NN;%���������źŵĹ�����
Pin=py(ff0);

y1=fft(x1,NN);%ͨ��SR����ź�x1��Ƶ��
py1=y1.*conj(y1)/NN;%��������źŵĹ�����
Pout=py1(ff0);%Ƶ��f0���Ĺ���

SAout=Pout/Pin;%��SAȡ������λΪdB
end





