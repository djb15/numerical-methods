func=@(vin,i,Res,Ind) (vin - Res*i)/Ind; % The ODE to be solved

i0 = 0; % set initial condtion of iL at t_0
R = 0.5; % set value of R
L = 0.0015; % set value of L
h=0.001; % set step-size
tf=0.035; % stop here

% Make a plot for step signal of amplitude 3.5V
N = round(tf/h);
v1 = repmat(3.5,1,N);
[t,vout] = ralston(func,i0,v1,tf,R,L,h);
figure;
plot(t,vout,'r');
xlabel('Time/s');
ylabel('Amplitude/V');
hold on;
% This plot is as expected as the circuit initially has a high voltage that
% decays over time due to the inductor


% make a plot for impulse decaying signal
time = 0:h:tf;
v2 = 4.5*exp(-(time.^2)/(100*10^-6));
[t,vout] = ralston(func,i0,v2,tf,R,L,h);
plot(t,vout,'b');
hold on;
%This plot oscillates very slightly due to the square term of time and is
%the expected behaviour of the circuit.


% Make a plot for another impulse decaying signal
v3 = 4.5*exp(-time/110*10^-6);
[t,vout] = ralston(func,i0,v3,tf,R,L,h);
plot(t,vout,'g');
legend('Vin = 3.5V','Impulse with t^2','Impulse with t','Location','Southwest');
% This looks extremely similar to the output with the step signal input and
% is the behaviour expected.

% Sine, square, sawtooth wave inputs at wavelength of 1000um
h = 0.0000001;
tf = 0.002;
time = 0:h:tf-h;
v4 = 4*sin((2*pi*time)/(1000*10^-6));
[t,vout] = ralston(func,i0,v4,tf,R,L,h);
figure;
plot(t,vout, 'r');
xlabel('Time/s');
ylabel('Amplitude/V');
hold on;

v5 = 4*square((2*pi*time)/(1000*10^-6));
[t,vout] = ralston(func,i0,v5,tf,R,L,h);
plot(t,vout, 'g');
hold on;

v6 = 4*sawtooth((2*pi*time)/(1000*10^-6));
[t,vout] = ralston(func,i0,v6,tf,R,L,h);
plot(t,vout,'b');
legend('Sine','Square','Sawtooth','Location','Southwest');


% Sine, square, sawtooth wave inputs at wavelength of 750um
h = 0.000001;
tf = 0.002;
time = 0:h:tf-h;
v7 = 4*sin((2*pi*time)/(750*10^-6));
[t,vout] = ralston(func,i0,v7,tf,R,L,h);
figure;
plot(t,vout, 'r');
xlabel('Time/s');
ylabel('Amplitude/V');
hold on;

v8 = 4*square((2*pi*time)/(750*10^-6));
[t,vout] = ralston(func,i0,v8,tf,R,L,h);
plot(t,vout, 'g');
hold on;

v9 = 4*sawtooth((2*pi*time)/(750*10^-6));
[t,vout] = ralston(func,i0,v9,tf,R,L,h);
plot(t,vout,'b');
legend('Sine','Square','Sawtooth','Location','Southwest');


%Sine, square and sawtooth wave inputs at wavelength 110um
h = 0.000001;
tf = 0.0003;
time = 0:h:tf-h;
v10 = 4*sin((2*pi*time)/(110*10^-6));
[t,vout] = ralston(func,i0,v10,tf,R,L,h);
figure;
plot(t,vout,'r');
xlabel('Time/s');
ylabel('Amplitude/V');
hold on;

v11 = 4*square((2*pi*time)/(110*10^-6));
[t,vout] = ralston(func,i0,v11,tf,R,L,h);
plot(t,vout,'g');
hold on;

v12 = 4*sawtooth((2*pi*time)/(110*10^-6));
[t,vout] = ralston(func,i0,v12,tf,R,L,h);
plot(t,vout,'b');
legend('Sine','Square','Sawtooth','Location','Southwest');


%Sine, square and sawtooth wave inputs at wavelength 35um
h = 0.0000001;
tf = 0.0001;
time = 0:h:tf-h;
v13 = 4*sin((2*pi*time)/(35*10^-6));
[t,vout] = ralston(func,i0,v13,tf,R,L,h);
figure;
plot(t,vout,'r');
xlabel('Time/s');
ylabel('Amplitude/V');
hold on;

v14 = 4*square((2*pi*time)/(35*10^-6));
[t,vout] = ralston(func,i0,v14,tf,R,L,h);
plot(t,vout,'g');
hold on;

v15 = 4*sawtooth((2*pi*time)/(35*10^-6));
[t,vout] = ralston(func,i0,v15,tf,R,L,h);
plot(t,vout,'b');
legend('Sine','Square','Sawtooth','Location','Southwest');

