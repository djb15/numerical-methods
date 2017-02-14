function [ t,Vout ] = midpoint( R,L,tf,iL0,h,vin )
N=round(tf/h); 
iLa=zeros(1,N); ta=zeros(1,N);Vout = zeros(1,N);
ta(1)=0; iLa(1)=iL0;Vout(1)=feval(vin,0); 


for j=1:N-1 
tt=ta(j);iLt=iLa(j); 
func=@(t,iL) 1./L*feval(vin,tt) -R./L*iLt;

k1=feval(func, tt,iLt);
k2 = feval(func,tt+0.5*h, iLt+0.5*h*k1);
iLa(j+1)=iLt + h*k2; 
ta(j+1)=tt+h; 
Vout(j+1)= feval(vin,tt+h)-R*iLa(j+1);
end

t=ta;



