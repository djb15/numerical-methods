h = 0.005;
k = 0.000012;
N = round(1/h);

U1 = zeros(N+1);
U2 = zeros(N+1);

divs = 0:h:1;
y0 = (sawtooth(2*pi*divs,0.5)+1)/2;
y1 = sin(2*pi*divs);
y2 = abs(sin(2*pi*divs));


U1(1,1:N+1) = y0;
U2(1,1:N+1) = y1;
U3(1,1:N+1) = y2;

%At x=0 and x=N (i.e. the start and end of the rod) the value is 0 for all
%m.  This corresponds to the first and last column of the matrix being 0.
v = k/h^2;
b = 1-2*v;


for m=2:1502
    for j=2:N
        U1(m,j) = v*U1(m-1,j-1) + b*U1(m-1,j) + v*U1(m-1, j+1);
        U2(m,j) = v*U2(m-1,j-1) + b*U2(m-1,j) + v*U2(m-1, j+1);
        U3(m,j) = v*U3(m-1,j-1) + b*U3(m-1,j) + v*U3(m-1, j+1);
    end
end

step = 1:150:1501;
figure(1);
figure(2);
figure(3);

for i=step
    figure(1);
    plot(divs,U1(i,1:N+1));
    hold on;
    figure(2);
    plot(divs,U2(i,1:N+1));
    hold on;
    figure(3);
    plot(divs,U3(i,1:N+1));
    hold on;
end
