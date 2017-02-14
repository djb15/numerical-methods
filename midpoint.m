function [ t,Vout ] = midpoint(func,i0,vin,tf,R,L,h)

N=round(tf/h); 

i=zeros(1,N);  
t=zeros(1,N);
Vout=zeros(1,N);
i(1) = i0;


for j=1:N-1 

k1 = feval(func,vin(j),i(j),R,L);
k2 = feval(func,vin(j)+0.5*h, i(j)+0.5*h*k1,R,L);
i(j+1)=i(j) + h*k2; 
t(j+1)=t(j)+h; 
Vout(j)= vin(j) - i(j)*R;
end
Vout(N)= vin(N) - i(N)*R;

end



