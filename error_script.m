func=@(vin,i,Res,Ind) (vin - Res*i)/Ind;

R = 0.5;
L = 0.0015;
i0 = 0;

h = 0.000001;
tf = 0.0002;
time = 0:h:tf-h;
vin = 4*sin((2*pi*time)/(120*10^-6));

[t,rals] = ralston(func,i0,vin,tf,R,L,h);
% Put the function calls for the other functions here, changing the vout
% name

c = (i0 - (vin(1)/R)+(L/(R^2)))*exp((R/L)*vin(1));
exacti = (vin/R) - (L/(R^2)); %+ c./exp((R/L)*vin);
exactout = vin - R*exacti;

figure;
plot(time,exactout,'b');
hold on;
plot(t,rals,'r');
