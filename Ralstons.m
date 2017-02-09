function [ t, vout ] = Ralstons( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

i0 = 0; % set initial condtion of iL at t_0
R = 0.5; % set value of R
L = 0.0015; % set value of L
t0=0;
h=0.001; % set step-size
tf=0.02; % stop here
Vin = 3.5; %test vout

func=@(t, i, Vin) (Vin - R*i)/L; % i'= (Vin(t) - R*i)/L 

N=round((tf-t0)/h); % set size of arrays, nr of steps

ia=zeros(1,N); %set up arrays 
ta=zeros(1,N);
Vouta=zeros(1,N);

ia(1)=i0; % initialize arrays
ta(1)=t0; 

for i=1:N-1 % loop for N steps
 ii = ia(i);% temporary names: limit nr of times array accessed 
 ti = ta(i); 

 k1 = feval(func, ti, ii, Vin); %evaluate function
 k2 = feval(func, ti, ii+(2/3)*h, Vin + (2/3)*h*k1);
 
 ia(i+1)= ii + h*(0.25*k1 + 0.75*k2); % next value of i calculated
 ta(i+1)=ti+h; % next value of t, increase by h
 
 Vouta(i) = Vin - ii*R;
end

figure;
plot(ta,Vouta);
end

