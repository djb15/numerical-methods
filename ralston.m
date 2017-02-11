function [t,vout] = ralston(func,i0,vin,tf,R,L,h)
    %UNTITLED2 Summary of this function goes here
    %   Detailed explanation goes here 

    N=round(tf/h); % set size of arrays, nr of steps

    i=zeros(1,N); %set up arrays 
    t=zeros(1,N);
    vout=zeros(1,N);

    i(1)=i0; % initialize arrays 

    for j=1:N-1 % loop for N steps
       
        k1 = feval(func,vin(j),i(j),R,L); %evaluate function
        k2 = feval(func,vin(j)+(2/3)*h,i(j)+(2/3)*h*k1,R,L);

        i(j+1)= i(j) + h*(0.25*k1 + 0.75*k2); % next value of i calculated
        t(j+1)=t(j)+h; % next value of t, increase by h

        vout(j) = vin(j) - i(j)*R;
    end
end

