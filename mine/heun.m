function [x,y] = heun(func,xf,h,x0,y0)
    N=round((xf-x0)/h);
    x=zeros(1,N);
    y=zeros(1);
    x(1)=x0;
    y(1)=y0;
    for i=1:N-1
        x(i+1)=x(i)+h;
        yp=y(i)+h*feval(func,x(i),y(i));
        grad1=feval(func,x(i),y(i));
        grad2=feval(func,x(i+1),yp);
        gradavg=0.5*(grad1+grad2);
        y(i+1)=y(i)+h*gradavg;
    end
end