%this script carries out error analysis of three methods for the RL circuit with a cosine input
%The exact solution of the ODE is computed mathematically (see report)
%the numerical solution is compared to the exact solution
%the error is plotted as a function of t for each method
%a log-log plot is made for a range of values of h, the step size



%Values for the current system
R = 0.5;
L = 0.0015;
i0 = 0;

 %stop here
h = 0.000001;
tf = 1000*h;%step size
tau = 120*10^-6;

%ODE for input into numerical methods - corresponds to the RL circuit
func=@(t,i, Vin) (Vin(t) - R*i)/L;

Vin =@(t) 4*cos((2*pi*t)/tau); %input of the system

%exact solution of the system
c = -(4*(tau^2)*R)/(4*(pi^2)*(L^2) + (tau^2)*(R^2)); %Value of c for the given initial conditions
exacti =@(t) c*exp(-(R*t)/L)+(8*pi*L*tau*sin((2*pi*t)/tau))/(4*(pi^2)*(L^2)+(tau^2)*(R^2)) + (4*(tau^2)*R*cos((2*pi*t)/tau))/(4*(pi^2)*(L^2)+(tau^2)*(R^2));
exactout =@(t, Vin, exacti) Vin(t) - R*arrayfun(exacti, t); %Exact system response

%carry out the numerical analysis of the system
[t1,ra] = ralston(func,i0,Vin,tf,R,h);
[t2,he] = heun(func,i0,Vin,tf,R,h);
[t3,mid]= midpoint(func,i0,Vin,tf,R,h);

% Plot the error of each of the numerical methods
%error = exact solution - numerical solution


figure;
error_rals = feval(exactout, t1, Vin, exacti)-ra;
error_heun = feval(exactout, t2, Vin, exacti)-he;
error_mid = feval(exactout, t3, Vin, exacti)-mid;


%label plots
subplot(2,3,1);
plot(t1,error_rals,'r');
xlabel('Time/s');
ylabel('Error/V');
title('Ralston error vs time');

subplot(2,3,2);
plot(t2,error_heun,'r');
xlabel('Time/s');
ylabel('Error/V');
title('Heun error vs time');

subplot(2,3,3);
plot(t3,error_mid,'r');
xlabel('Time/s');
ylabel('Error/V');
title('Midpoint error vs time');


%log-log plot
tf = 5; %stop here

for ind=15:20   %create loop to carry out error analysis for different step sizes
    h = 2^(-ind);
    tf = 1000*h;
    %input to the system
    %exact solution as before
    
    
    %carry out the numerical analysis of the system
    [t1,ra] = ralston(func,i0,Vin,tf,R,h);
    [t2,he] = heun(func,i0,Vin,tf,R,h);
    [t3,mid] = midpoint(func,i0,Vin,tf,R,h);
    
    error_rals = max(abs(feval(exactout,t1, Vin, exacti)-ra));
    error_heun = max(abs(feval(exactout, t2, Vin, exacti)-he));
    error_mid = max(abs(feval(exactout, t3, Vin, exacti)-mid));
    
    %error of each of the numerical methods
    %error is maximum of (error = exact - numerical)
    
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