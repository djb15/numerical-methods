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
Vout=zeros(1,N);
i(1) = i0;      % set up initial condition

    for j=1:N-1     % loop N times

      k1 = feval(func,vin(j),i(j),R,L); % evaluate k1 as function at i
      k2 = feval(func,vin(j)+0.5*h, i(j)+0.5*h*k1,R,L); % evaluate k2 as function at midpoint between i and i+1
      i(j+1)=i(j) + h*k2; % next value of i calculated
      t(j+1)=t(j)+h;      % next value of t as t+h
      
    end
 
 Vout(N)= vin(N) - i(N)*R;

end



