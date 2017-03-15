function [qnext,ynext] = RK4second(qdash,ydash,R,L,C,vi,yi,qi,h)
    % Performs the RK4 3/8 numerical method
    % qdash calculates the derivative of q at a point (ti, qi, yi)
    % ydash calculates the derivative of y at a point (ti, qi ,yi)


   %calculate coefficients (predicted gradients) at ti, ti+h/3, ti+2h/3, ti+h
   %using Runge-Kutta 3/8
    k1q=feval(qdash,yi);
    k1y=feval(ydash,vi,qi,yi,R,L,C);
    
    k2q=feval(qdash,yi+(1/3)*h*k1y);
    k2y=feval(ydash,vi+(1/3)*h,qi+(1/3)*h*k1q,yi+(1/3)*h*k1y,R,L,C);
    
    k3q=feval(qdash,yi-(1/3)*h*k1y+h*k2y);
    k3y=feval(ydash,vi+(2/3)*h,qi-(1/3)*h*k1q+h*k2q,yi-(1/3)*h*k1y+h*k2y,R,L,C);
    
    k4q=feval(qdash,yi+h*k1y-h*k2y+h*k3y);
    k4y=feval(ydash,vi+h,qi+h*k1q-h*k2q+h*k3q,yi+h*k1y-h*k2y+h*k3y,R,L,C);
    
    %obtain qnext and ynext by taking weighted average of obtained gradients
    qnext=qi+(1/8)*h*(k1q+3*k2q+3*k3q+k4q);
    ynext=yi+(1/8)*h*(k1y+3*k2y+3*k3y+k4y);
end
    