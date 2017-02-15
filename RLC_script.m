qdash=@(y) y;
ydash=@(vin,q,y,R,L,C) (1/L)*vin - (R/L)*y - (1/(L*C))*q;

tf=0.02;
h=0.000001;
time=0:h:tf-h;
N=round(tf/h);
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);
q(1)=500*10^-9;
y(1)=0;

R=260;
L=500*10^-3;
C=3.5*10^-6;

figure;

inputv1=repmat(5,1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,inputv1(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout);

hold on;
inputv2=5*exp(-(time.^2)/3*10^-3);
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,inputv2(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout,'r');


figure;
tf=0.5;
h=0.00001;
time=0:h:tf-h;
square1=5*square(2*pi*5*time);
N=round(tf/h);
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,square1(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout,'r');
hold on;

sin1=5*sin(2*pi*5*time);
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,sin1(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout,'b');


figure;
tf=0.05;
h=0.00001;
time=0:h:tf-h;
square2=5*square(2*pi*110*time);
N=round(tf/h);
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,square2(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout,'r');
hold on;

sin2=5*sin(2*pi*110*time);
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,sin2(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout,'b');



figure;
tf=0.02;
h=0.000001;
time=0:h:tf-h;
square3=5*square(2*pi*500*time);
N=round(tf/h);
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,square3(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout,'r');
hold on;


sin3=5*sin(2*pi*500*time);
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,sin3(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout,'b');






    