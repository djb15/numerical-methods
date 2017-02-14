R =0.5;
L=0.0015;
tf=0.002;
iL0 =0;
h=0.000005; 
T = 0.000350;
f = 1./T;
vin=@(t) 4*sawtooth(2*pi*f*t);
 
 
 
[t,Vout]=midpoint( R,L,tf,iL0,h,vin );
 
