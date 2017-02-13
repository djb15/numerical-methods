func=@(vin,i,Res,Ind) (vin - Res*i)/Ind;

R = 0.5;
L = 0.0015;
i0 = 0;

tf = 5;

N = round(tf/h);


figure;

for ind=14:21
    h = 2^(-ind);
    time = 0:h:tf-h;
    vin = 4*cos((2*pi*time)/(120*10^-6));
    c = -(36*R)/(2500000000*pi^2*L^2+9*0.5^2);
    exacti = c*exp(-(R*time)/L) + (600000*pi*L*sin((50000*pi*time)/3) + 36*R*cos((50000*pi*time)/3))/(2500000000*pi^2*L^2 + 9*R^2);
    exactout = vin - R*exacti;
    
    [t,rals] = ralston(func,i0,vin,tf,R,L,h);
    error_rals = max(abs(exactout-rals));
    plot(log(h), log(error_rals), 'b*');
    hold on;
end
