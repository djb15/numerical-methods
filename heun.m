function [time,vout] = heun(func,i0,vin,tf,R,L,h)
%Performs the Heun numerical method (output t,vout)
    %   func = ODE
    %   i0 = Initial condition
    %   vin = Prebuilt array with input voltage waveform
    %   tf = Final time
    %   R = Resistor value
    %   L = Inductor value
    %   h = step size
N = round(tf/h); % set up number of steps/size of arrays
i = zeros(1,N); % set up arrays
time = zeros(1,N);
vout = zeros(1,N);
i(1) = i0; % set initial value of i

for j = 1:N-1 % loop for N-1 steps
    ip = i(j) + h*feval(func, vin(j), i(j), R, L); % predictor for next value of i
    grad1=feval(func, vin(j)+h, ip, R, L); % gradient at t+h
    grad2=feval(func, vin(j), i(j), R, L); % gradient at t
    iave=0.5*(grad1+grad2); % average gradient over [t,t+h]
    i(j+1)=i(j)+h*iave; % new i from euler, using iave as gradient
    time(j+1)=time(j)+h; %step by h for next value of t
    
    vout(j) = vin(j) - i(j)*R; %set up vout array using vin and estimated i(j)
end
vout(N) = vin(N) - i(N)*R; %work out output voltage
end

