%this script carries out error analysis of three methods for the RL circuit with a cosine input
%The exact solution of the ODE is computed mathematically (see report)
%the numerical solution is compared to the exact solution
%the error is plotted as a function of t for each method
%a log-log plot is made for a range of values of h, the step size

%ODE for input into numerical methods - corresponds to the RL circuit
func=@(Vin,i,Res,Lind) (Vin - Res*i)/Lind; 

%Values for the current system
R = 0.5;
L = 0.0015;
i0 = 0;

tf = 0.0005; %stop here
h = 0.000001; %step size
time = 0:h:tf-h;
Vin = 4*cos((2*pi*time)/(120*10^-6)); %input of the system

%exact solution of the system
c = -(36*R)/(2500000000*pi^2*L^2+9*0.5^2); %Value of c for the given initial conditions
exacti = c*exp(-(R*time)/L) + (600000*pi*L*sin((50000*pi*time)/3) + 36*R*cos((50000*pi*time)/3))/(2500000000*pi^2*L^2 + 9*R^2);
exactout = Vin - R*exacti; %Exact system response

%carry out the numerical analysis of the system
[~,ra] = ralston(func,i0,Vin,tf,R,L,h);
[~,he] = heun(func,i0,Vin,tf,R,L,h);
[t,mid]= midpoint(func,i0,Vin,tf,R,L,h);

% Plot the error of each of the numerical methods
%error = exact solution - numerical solution
figure;
error_rals = exactout-ra;
error_heun = exactout-he;
error_mid = exactout-mid;

%label plots
subplot(2,3,1);
plot(t,error_rals,'r');
xlabel('Time/s');
ylabel('Error/V');
title('Ralston error vs time');

subplot(2,3,2);
plot(t,error_heun,'r');
xlabel('Time/s');
ylabel('Error/V');
title('Heun error vs time');

subplot(2,3,3);
plot(t,error_mid,'r');
xlabel('Time/s');
ylabel('Error/V');
title('Midpoint error vs time');


%log-log plot
tf = 5; %stop here

for ind=10:1:17   %create loop to carry out error analysis for different step sizes
    h = 2^(-ind);
    time = 0:h:tf-h;
    Vin = 4*cos((2*pi*time)/(120*10^-6)); %input to the system
    %exact solution as before
    c = -(36*R)/(2500000000*pi^2*L^2+9*0.5^2);
    exacti = c*exp(-(R*time)/L) + (600000*pi*L*sin((50000*pi*time)/3) + 36*R*cos((50000*pi*time)/3))/(2500000000*pi^2*L^2 + 9*R^2);
    exactout = Vin - R*exacti;
    
    %carry out the numerical analysis of the system
    [~,ra] = ralston(func,i0,Vin,tf,R,L,h);
    [~,he] = heun(func,i0,Vin,tf,R,L,h);
    [t,mid] = midpoint(func,i0,Vin,tf,R,L,h);
    
    %error of each of the numerical methods
    %error is maximum of (error = exact - numerical)
    error_rals = max(abs(exactout-ra));
    error_heun = max(abs(exactout-he));
    error_mid = max(abs(exactout-mid));
    
    %plot log-log results
    subplot(2,3,4);
    plot(log(h), log(error_rals), 'b*');
    hold on;
    subplot(2,3,5);
    plot(log(h), log(error_heun), 'b*');
    hold on;
    subplot(2,3,6);
    plot(log(h), log(error_mid), 'b*');
    hold on;
end

%label plots
subplot(2,3,4);
title('Ralston error log-log plot');
xlabel('log(step size)');
ylabel('log(error)');
subplot(2,3,5);
title('Heun error log-log plot');
xlabel('log(step size)');
ylabel('log(error)');
subplot(2,3,6);
title('Midpoint error log-log plot');
xlabel('log(step size)');
ylabel('log(error)');