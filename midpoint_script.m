

i0 = 0; % set initial condtion of iL at t_0
R = 0.5; % set value of R
L = 0.0015; % set value of L
h=0.001; % set step-size
tf=0.035; % stop here

func=@(t,i,vin) (vin(t) - R*i)/L; % The ODE to be solved

% Make a plot for step signal of amplitude 3.5V
vin =@(t) 3.5;
[t,vout] = midpoint(func,i0,vin,tf,R,h);
figure;
plot(t,vout,'r');
xlabel('Time/s');
ylabel('Amplitude/V');
title('Impluse reponses');
hold on;
% This plot is as expected as the circuit initially has a high voltage that
% decays over time due to the inductor


% make a plot for impulse decaying signal
vin =@(t) 4.5*exp(-(t.^2)/(100*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout,'b');
hold on;
%This plot oscillates very slightly due to the square term of time and is
%the expected behaviour of the circuit.


% Make a plot for another impulse decaying signal
vin =@(t) 4.5*exp(-t/110*10^-6);
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout,'g');
legend('Vin = 3.5V','Impulse with t^2','Impulse with t','Location','Northeast');
% This looks extremely similar to the output with the step signal input and
% is the behaviour expected.

% Sine, square, sawtooth wave inputs at wavelength of 1000um
h = 0.0000001;
tf = 0.002;

vin =@(t) 4*sin((2*pi*t)/(1000*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
figure;
subplot(2,2,4);
plot(t,vout, 'r');
xlabel('Time/s');
ylabel('Amplitude/V');
title('Sine of wavelength 1000um');
hold on;

vin =@(t) 4*square((2*pi*t)/(1000*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout, 'g');
hold on;

vin =@(t) 4*sawtooth((2*pi*t)/(1000*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout,'b');
legend('Sine','Square','Sawtooth','Location','Southwest');


% Sine, square, sawtooth wave inputs at wavelength of 750um
h = 0.000001;
tf = 0.002;

vin =@(t) 4*sin((2*pi*t)/(750*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
subplot(2,2,3);
plot(t,vout, 'r');
xlabel('Time/s');
ylabel('Amplitude/V');
title('Sine of wavelength 750um');
hold on;

vin =@(t) 4*square((2*pi*t)/(750*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout, 'g');
hold on;

vin =@(t) 4*sawtooth((2*pi*t)/(750*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout,'b');
legend('Sine','Square','Sawtooth','Location','Southwest');


%Sine, square and sawtooth wave inputs at wavelength 110um
h = 0.000001;
tf = 0.0003;

vin =@(t) 4*sin((2*pi*t)/(110*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
subplot(2,2,2);
plot(t,vout,'r');
xlabel('Time/s');
ylabel('Amplitude/V');
title('Sine of wavelength 110um');
hold on;

vin =@(t) 4*square((2*pi*t)/(110*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout,'g');
hold on;

vin =@(t) 4*sawtooth((2*pi*t)/(110*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout,'b');
legend('Sine','Square','Sawtooth','Location','Southwest');


%Sine, square and sawtooth wave inputs at wavelength 35um
h = 0.0000001;
tf = 0.0001;

vin =@(t) 4*sin((2*pi*t)/(35*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
subplot(2,2,1);
plot(t,vout,'r');
xlabel('Time/s');
ylabel('Amplitude/V');
title('Sine of wavelength 35um');
hold on;

vin =@(t) 4*square((2*pi*t)/(35*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout,'g');
hold on;

vin =@(t) 4*sawtooth((2*pi*t)/(35*10^-6));
[t,vout] = midpoint(func,i0,vin,tf,R,h);
plot(t,vout,'b');
legend('Sine','Square','Sawtooth','Location','Southwest');



