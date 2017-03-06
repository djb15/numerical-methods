function [ t,Vout ] = midpoint(func,i0,vin,tf,R,L,h)
% Performs the Midpoint numerical method (output t,vout)
% func = ODE
% i0 = Initial condition
% vin = Prebuilt array with input voltage waveform
% tf = Final time
% R = Resistor value
% L = Inductor value
% h = step size

N=round(tf/h);  % set up number of steps/size of arrays
i=zeros(1,N);   % set up arrays
t=zeros(1,N);
i(1) = i0;      % set up initial condition

    for x=1:N-1     % loop N times
      k1 = feval(func,t(x),i(x), vin); % evaluate k1 as function at i
      k2 = feval(func,t(x)+0.5*h, i(x)+0.5*h*k1, vin); % evaluate k2 as function at midpoint between i and i+1
      i(x+1)=i(x) + h*k2; % next value of i calculated
      t(x+1)=t(x)+h;      % next value of t as t+h   
       %set up vout array using vin and estimated i(j)
    end
 Vout = arrayfun(vin,t) - i*R;
end



