h = 0.005;
k = 0.000012;
N = round(1/h);

% Assigning h to split spatial domain into 200 segments
% Assigning k to split time domain into reasonable number of segments to observe the changes properly
% N= number of segments in the spatial axis

U1 = zeros(N+1); % Set up zero matrix for each function
U2 = zeros(N+1);
U3 = zeros(N+1);
U4 = zeros(N+1);
U5 = zeros(N+1);
U6 = zeros(N+1);
U7 = zeros(N+1);

divs = 0:h:1;  % To go from 0 to 1 in steps of h i.e to set up discrete points

y0 = (sawtooth(2*pi*divs,0.5)+1)/2; % Tent function
y1 = sin(2*pi*divs);                % Sinusoidal function   
y2 = abs(sin(2*pi*divs));           % Absolute sinusoidal function
y3 = square(2*pi*divs);             % Square wave function  
y4 = sawtooth(2*pi*divs);           % Sawtooth wave function


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



for m=2:1502    % Setting the time axis
    % Time varying boundary conditions set here also
    U7(m,1) = feval(low_bound, (m-1)*k);
    U7(m,N+1) = feval(high_bound, (m-1)*k);
    
    for j=2:N   % Setting the spatial axis
        U1(m,j) = v*U1(m-1,j-1) + b*U1(m-1,j) + v*U1(m-1, j+1);
        U2(m,j) = v*U2(m-1,j-1) + b*U2(m-1,j) + v*U2(m-1, j+1);
        U3(m,j) = v*U3(m-1,j-1) + b*U3(m-1,j) + v*U3(m-1, j+1);
        U4(m,j) = v*U4(m-1,j-1) + b*U4(m-1,j) + v*U4(m-1, j+1);
        U5(m,j) = v*U5(m-1,j-1) + b*U5(m-1,j) + v*U5(m-1, j+1);
        U6(m,j) = v*U6(m-1,j-1) + b*U6(m-1,j) + v*U6(m-1, j+1);
        U7(m,j) = v*U7(m-1,j-1) + b*U7(m-1,j) + v*U7(m-1, j+1);
    end
end
% Implementing eq (1) for each discrete point

step = 1:150:1501; % Reasonable value of time step chosen to observe the changes for each function
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
% To plot each function on a graph


% Plot the time varying boundary conditions on a seperate figure
figure;
for i=step
    plot(divs,U7(i,1:N+1));
    hold on;
end


