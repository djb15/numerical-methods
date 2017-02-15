qdash=@(y) y;
ydash=@(vin,q,y,R,L,C) (1/L)*vin - (R/L)*y - (1/(L*C))*q;

tf=0.02;
h=0.000001;
time=0:h:tf-h;
N=round(tf/h);
inputv=repmat(5,1,N);
q=zeros(N);
y=zeros(N);
vout=zeros(N);
q(1)=500*10^-9;
y(1)=0;

R=260;
L=500*10^-3;
C=3.5*10^-6;

figure;

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,inputv(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout);
    