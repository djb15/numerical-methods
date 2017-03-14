func1 = @(y) y;
func2 = @(vin,q,y, R, L, C) (1/L)*vin-(R/L)*y-(1/(L*C))*q;

tf=0.02;
h=0.0001;
N = round(tf/h);
time=0:h:tf-h;
q0=500*10^-9;
y0 = 0;

R=260;
L=500*10^-3;
C=3.5*10^-6;

%Constant input
figure;
v1=repmat(5,1,N);

[vout] = RK4Secondv2(func1, func2, q0, v1, y0, tf, R, L, C, h);

plot(time, vout, 'b');
hold on;

%exponential input
figure;
tf=0.05;
h=0.00001;
time=0:h:tf-h;
v2=5*exp(-(time.^2)/3*10^-3);

[vout] = RK4Secondv2(func1, func2, q0, v2, y0, tf, R, L, C, h);
plot(time, vout, 'r');
hold on;

%Square and sinewave 1
tf=0.5;
h=0.00001;
time=0:h:tf-h;
figure;
square1=5*square(2*pi*5*time);
[vout] = RK4Secondv2(func1, func2, q0, square1, y0, tf, R, L, C, h);
plot(time, vout, 'r');
hold on;

sin1=5*sin(2*pi*5*time);
[vout] = RK4Secondv2(func1, func2, q0, sin1, y0, tf, R, L, C, h);
plot(time, vout, 'b');
hold on;

%Square and sinewave 2
tf=0.05;
h=0.00001;
time=0:h:tf-h;
figure;
square2=5*square(2*pi*110*time);
[vout] = RK4Secondv2(func1, func2, q0, square2, y0, tf, R, L, C, h)
plot(time, vout, 'r');
hold on;

sin2=5*sin(2*pi*110*time);
[vout] = RK4Secondv2(func1, func2, q0, sin2, y0, tf, R, L, C, h);
plot(time, vout, 'b');
hold on;

%Square and sinewave 3
tf=0.02;
h=0.00001;
time=0:h:tf-h;
figure;
square3=5*square(2*pi*500*time);
[vout] = RK4Secondv2(func1, func2, q0, square3, y0, tf, R, L, C, h);
plot(time, vout, 'r');
hold on;

sin3=5*sin(2*pi*500*time);
[vout] = RK4Secondv2(func1, func2, q0, sin3, y0, tf, R, L, C, h);
plot(time, vout, 'b');
hold on;

