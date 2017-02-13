function [t,vout] = ralston(func,i0,vin,tf,R,L,h)
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
    vout=zeros(1,N);

    i(1)=i0; % initial condition setup 

    for j=1:N-1 % loop for N steps
       
        k1 = feval(func,vin(j),i(j),R,L); %evaluate function for k1 and k2
        k2 = feval(func,vin(j)+(2/3)*h,i(j)+(2/3)*h*k1,R,L);

        i(j+1)= i(j) + h*(0.25*k1 + 0.75*k2); % next value of i calculated
        t(j+1)=t(j)+h; % next value of t, increase by h

        vout(j) = vin(j) - i(j)*R; %returns vout from vin and estimated current
    end
    vout(N) = vin(N) - i(N)*R;
end

