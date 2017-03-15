%The RLC script calculates the voltage across R (Vout) for a given
%input signal(Vin)

qdash=@(y) y;
ydash=@(vin,q,y,R,L,C) (1/L)*vin - (R/L)*y - (1/(L*C))*q;

%Set all the variables for use in the for loops later
tf=0.02; % Final time
h=0.000001; % Step size
time=0:h:tf-h; % Make time matrix
N=round(tf/h); % Number of time iterations
q=zeros(1,N);
y=zeros(1,N);
vout=zeros(1,N);
% Set initial conditions
q(1)=500*10^-9;
y(1)=0;

R=260;
L=500*10^-3;
C=3.5*10^-6;

figure;

%Input of 5V step signal
inputv1=repmat(5,1,N);

for j=1:N-1
    [qnext,ynext] = RK4second(qdash,ydash,R,L,C,inputv1(j),y(j),q(j),h);
    q(j+1)=qnext;
    y(j+1)=ynext;
    vout(j)=R*y(j);
end
vout(N)=R*y(N);
plot(time,vout);
title('Plot of 5V impulse and 5V decaying impulse');
xlabel('Time/s');
ylabel('Voltage/V');

hold on;
% Input of decaying inpulse signal 
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
legend('Step','Impulsive Decay','Location','Southwest');


% Modifying time and step sizes for input of square wave and sine waves of
% varying period for the following set of plots
figure;
tf=0.5;
h=0.00001;
time=0:h:tf-h;
square1=5*square(2*pi*5*time); %Square wave of frequency 5Hz
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


sin1=5*sin(2*pi*5*time); %Sine wave of frequency 5Hz
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
xlabel('Time/s');
ylabel('Voltage/V');
title('Plot of 5Hz sine wave and square wave through given RLC circuit');
legend('Square', 'Sine', 'Location', 'Southwest');


figure;
tf=0.05;
h=0.00001;
time=0:h:tf-h;
square2=5*square(2*pi*110*time); %Square wave of 110Hz
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

sin2=5*sin(2*pi*110*time); %Sine wave of 110Hz
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
xlabel('Time/s');
ylabel('Voltage/V');
title('Plot of 110Hz sine wave and square wave through given RLC circuit');
legend('Square', 'Sine', 'Location', 'Southwest');



figure;
tf=0.02;
h=0.000001;
time=0:h:tf-h;
square3=5*square(2*pi*500*time); %500Hz Square wave
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


sin3=5*sin(2*pi*500*time); %500Hz sine wave
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
xlabel('Time/s');
ylabel('Voltage/V');
title('Plot of 500Hz sine wave and square wave through given RLC circuit');
legend('Square', 'Sine', 'Location', 'Southwest');







    