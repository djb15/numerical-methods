function [t,vout] = heun(func,i0,vin,tf,R,L,h)
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
t = zeros(1,N);
i(1) = i0; % set initial value of i

for x = 1:N-1 % loop for N-1 steps
    ip = i(x) + h*feval(func, t(x), i(x), vin); % predictor for next value of i
    grad1=feval(func, t(x), ip, vin); % gradient at t+h
    grad2=feval(func, t(x), i(x), vin); % gradient at t
    iave=0.5*(grad1+grad2); % average gradient over [t,t+h]
    i(x+1)=i(x)+h*iave; % new i from euler, using iave as gradient
    t(x+1)=t(x)+h; %step by h for next value of t
    

end
vout = arrayfun(vin,t) - i*R; %set up vout array using vin and estimated i(j); %work out output voltage
end

