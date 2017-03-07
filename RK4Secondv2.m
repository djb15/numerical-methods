function [  vout ] = RK4Secondv2( func1, func2,q0,vi,y0,tf,R,L,C,h)
    %Performs the RK 3/8 numerical method (output t,vout)
    %   func1, func2 = ODE
    %   q0 = Initial condition
    %   vin = Prebuilt array with input voltage waveform
    %   tf = Final time
    %   R = Resistor value
    %   L = Inductor value
    %   C = Capacitor value
    %   h = step size
    
    N = round(tf/h)
    
     %set up arrays 
    q=zeros(1,N);
    y=zeros(1,N);
    vout = zeros(1,N);
    
    q(1) = q0;
    y(1) = y0;
    
    for j = 1:N-1
        vout(j) = R*y(j);
        k1q = feval(func1, y(j));
        k1y = feval(func2, vi(j), q(j), y(j), R, L, C);
        k2q = feval(func1, y(j)+h*(1/3)*k1y);
        k2y = feval(func2, vi(j)+h*(1/3), q(j)+h*(1/3)*k1q, y(j)+h*(1/3)*k1y, R, L, C);
        k3q = feval(func1, y(j)-h*(1/3)*k1y+h*k2y);
        k3y = feval(func2, vi(j)+h*(2/3), q(j)-h*(1/3)*k1q+h*k2q, y(j)-h*(1/3)*k1y+h*k2y, R, L, C);
        k4q = feval(func1,y(j)-h*(k1y-k2y+k3y));
        k4y = feval(func2, vi(j)+h, q(j)+h*(k1q-k2q+k3q), y(j)-h*(k1y-k2y+k3y), R, L, C);
        phiq = h*(1/8)*(k1q+3*k2q+3*k3q+k4q);
        phiy = h*(1/8)*(k1y+3*k2y+3*k3y+k4y);
        q(j+1) = q(j) + phiq;
        y(j+1) = y(j) + phiy;
    end

end

