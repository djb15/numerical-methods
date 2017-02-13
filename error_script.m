func=@(vin,i,Res,Ind) (vin - Res*i)/Ind; %ODE for input into numerical methods

%Values for the current system
R = 0.5;
L = 0.0015;
i0 = 0;

tf = 0.0005;
h = 0.000001;
time = 0:h:tf-h;
vin = 4*cos((2*pi*time)/(120*10^-6));
c = -(36*R)/(2500000000*pi^2*L^2+9*0.5^2); %Value of c for the given initial conditions
exacti = c*exp(-(R*time)/L) + (600000*pi*L*sin((50000*pi*time)/3) + 36*R*cos((50000*pi*time)/3))/(2500000000*pi^2*L^2 + 9*R^2);
exactout = vin - R*exacti; %Exact system response

[t,rals] = ralston(func,i0,vin,tf,R,L,h);

figure; % Plot the error of each of the numerical methods 
error_rals = exactout-rals;
plot(t,error_rals,'r');
xlabel('Time/s');
ylabel('Error/V');
title('Ralston error');


figure;
tf = 5;

for ind=14:20
    h = 2^(-ind);
    time = 0:h:tf-h;
    vin = 4*cos((2*pi*time)/(120*10^-6));
    c = -(36*R)/(2500000000*pi^2*L^2+9*0.5^2);
    exacti = c*exp(-(R*time)/L) + (600000*pi*L*sin((50000*pi*time)/3) + 36*R*cos((50000*pi*time)/3))/(2500000000*pi^2*L^2 + 9*R^2);
    exactout = vin - R*exacti;
    
    [t,rals] = ralston(func,i0,vin,tf,R,L,h);
    error_rals = max(abs(exactout-rals));
    plot(log(h), log(error_rals), 'b*');
    legend('Ralston', 'Location', 'Southwest');
    hold on;
end
