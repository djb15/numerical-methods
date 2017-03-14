h = 0.005;
k = 0.000012;
N = round(1/h);

U1 = zeros(N+1);
U2 = zeros(N+1);
U3 = zeros(N+1);
U4 = zeros(N+1);
U5 = zeros(N+1);
U6 = zeros(N+1);
U7 = zeros(N+1);

divs = 0:h:1;
y0 = (sawtooth(2*pi*divs,0.5)+1)/2;
y1 = sin(2*pi*divs);
y2 = abs(sin(2*pi*divs));
y3 = square(2*pi*divs);
y4 = sawtooth(2*pi*divs);


U1(1,2:N) = y0(2:N);
U2(1,2:N) = y1(2:N);
U3(1,2:N) = y2(2:N);
U4(1,2:N) = y3(2:N);
U5(1,2:N) = y4(2:N);
U6(1,2:N) = y0(2:N);
U7(1,2:N) = y0(2:N);

%At x=0 and x=N (i.e. the start and end of the rod) the value is 0 for all
%m.  This corresponds to the first and last column of the matrix being 0.
v = k/h^2;
b = 1-2*v;

% Set non-zero constant boundary conditions here
low_bound = 2;
high_bound = 0;

U6(1:N+1,1) = low_bound;
U6(1:N+1,N+1) = high_bound;

% Set time varying boundary conditions here
low_bound = @(time) 100*exp(-(2+50*time));
high_bound = @(time) 100*exp(-(2+50*time));

U7(1,1) = feval(low_bound, 0);
U7(1,N+1) = feval(high_bound, 0);



for m=2:1502
    % Time varying boundary conditions set here also
    U7(m,1) = feval(low_bound, (m-1)*k);
    U7(m,N+1) = feval(high_bound, (m-1)*k);
    
    for j=2:N
        U1(m,j) = v*U1(m-1,j-1) + b*U1(m-1,j) + v*U1(m-1, j+1);
        U2(m,j) = v*U2(m-1,j-1) + b*U2(m-1,j) + v*U2(m-1, j+1);
        U3(m,j) = v*U3(m-1,j-1) + b*U3(m-1,j) + v*U3(m-1, j+1);
        U4(m,j) = v*U4(m-1,j-1) + b*U4(m-1,j) + v*U4(m-1, j+1);
        U5(m,j) = v*U5(m-1,j-1) + b*U5(m-1,j) + v*U5(m-1, j+1);
        U6(m,j) = v*U6(m-1,j-1) + b*U6(m-1,j) + v*U6(m-1, j+1);
        U7(m,j) = v*U7(m-1,j-1) + b*U7(m-1,j) + v*U7(m-1, j+1);
    end
end

step = 1:150:1501;
figure;

for i=step
    subplot(2,3,1);
    plot(divs,U1(i,1:N+1));
    title('Triangle wave initial condition');
    xlabel('Distance');
    hold on;
    subplot(2,3,2);
    plot(divs,U2(i,1:N+1));
    title('Sine wave initial condition');
    xlabel('Distance');
    hold on;
    subplot(2,3,3);
    plot(divs,U3(i,1:N+1));
    title('|Sine| wave initial condition');
    xlabel('Distance');
    hold on;
    subplot(2,3,4);
    plot(divs,U4(i,1:N+1));
    title('Square wave initial condition');
    xlabel('Distance');
    hold on;
    subplot(2,3,5);
    plot(divs,U5(i,1:N+1));
    title('Sawtooth wave initial condition');
    xlabel('Distance');
    hold on;
    subplot(2,3,6);
    plot(divs,U6(i,1:N+1));
    title('Triangle wave with non-zero constant boundary conditions');
    xlabel('Distance');
    hold on;
end

figure;
for i=step
    plot(divs,U7(i,1:N+1));
    hold on;
end

