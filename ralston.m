function [t,vout] = ralston(func,i0,vin,tf,R,h)
    %Performs the ralston numerical method (output t,vout)
    %   func = ODE
    %   i0 = Initial condition
    %   vin = Prebuilt array with input voltage waveform
    %   tf = Final time
    %   R = Resistor value
    %   L = Inductor value
    %   h = step size

    N=round(tf/h); % set size of arrays, nr of steps

    i=zeros(1,N); %set up arrays 
    t=zeros(1,N);

    i(1)=i0; % initial condition setup 

    for x=1:N-1 % loop for N steps
       
        k1 = feval(func,t(x),i(x), vin); %evaluate function for k1 and k2
        k2 = feval(func,t(x)+(2/3)*h,i(x)+(2/3)*h*k1, vin);

        i(x+1)= i(x) + h*(0.25*k1 + 0.75*k2); % next value of i calculated
        t(x+1)=t(x)+h; % next value of t, increase by h

        
    end
    vout = arrayfun(vin,t) - i*R; %returns vout from vin and estimated current
end

